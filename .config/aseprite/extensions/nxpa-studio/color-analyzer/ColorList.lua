local ColorList = {};

ColorList.SortOptions = {
    "Usage Desc.", "Usage Asc.", "Value Desc.", "Value Asc."
};

function ColorList:GetColorsFromImage(image)
    for x = 0, image.width - 1 do
        for y = 0, image.height - 1 do
            local value = image:getPixel(x, y);

            self:Add(value);
        end
    end
end

function ColorList:Add(value)
    for i, color in ipairs(self) do
        if color.value == value then
            self[i].count = self[i].count + 1;
            return;
        end
    end

    local palette = app.activeSprite.palettes[1];

    local paletteIndex = 0;

    local color = Color(value);

    for i = 0, #palette - 1 do
        local paletteColor = palette:getColor(i);

        if paletteColor.rgbaPixel == color.rgbaPixel then
            paletteIndex = i;
            break
        end
    end

    -- Saving separate values for r, g, b and a is the only way I found to preserve color in Indexed Color Mode
    table.insert(self, {
        paletteIndex = paletteIndex,
        value = value,
        red = color.red,
        green = color.green,
        blue = color.blue,
        alpha = color.alpha,
        colorValue = color.value,
        count = 1
    });
end

function ColorList:Sort(sortOption)
    local sortFunction = nil;

    if sortOption == self.SortOptions[1] then
        sortFunction = function(a, b) return a.count > b.count end;
    elseif sortOption == self.SortOptions[2] then
        sortFunction = function(a, b) return a.count < b.count end;
    elseif sortOption == self.SortOptions[3] then
        sortFunction = function(a, b) return a.colorValue > b.colorValue end;
    elseif sortOption == self.SortOptions[4] then
        sortFunction = function(a, b) return a.colorValue < b.colorValue end;
    end

    table.sort(self, sortFunction);
end

function ColorList:CopyToPalette(palette)
    for i, color in ipairs(self) do palette:setColor(i, color.value); end
end

function ColorList:CopyToIndexedPalette(palette)
    -- Changing format to RGB temporarily to preserve color in the image
    app.command.ChangePixelFormat {format = "rgb"};

    for i, color in ipairs(self) do
        color.value = palette:getColor(color.value);
    end

    self:CopyToPalette(palette);

    app.command.ChangePixelFormat {format = "indexed"};
end

function ColorList:Clear() for i, _ in ipairs(self) do self[i] = nil; end end

return ColorList;

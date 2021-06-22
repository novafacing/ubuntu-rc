Transaction = dofile("../shared/Transaction.lua");
ScaleAlgorithm = dofile("./ScaleAlgorithm.lua");

return function(dialogTitle)
    local dialog = Dialog(dialogTitle);

    dialog:separator{text = "Algorithm:"}:button{
        text = "Eagle",
        onclick = Transaction(function()
            ScaleAlgorithm:Eagle(app.activeSprite)
        end)
    }:newrow():button{
        text = "Scale2x",
        onclick = Transaction(function()
            ScaleAlgorithm:Scale2x(app.activeSprite)
        end)
    }:newrow():button{
        text = "Scale3x",
        onclick = Transaction(function()
            ScaleAlgorithm:Scale3x(app.activeSprite)
        end)
    }:newrow():button{
        text = "Hawk D",
        onclick = Transaction(function()
            ScaleAlgorithm:Hawk(app.activeSprite, false)
        end)
    }:button{
        text = "Hawk N",
        onclick = Transaction(function()
            ScaleAlgorithm:Hawk(app.activeSprite, true)
        end)
    }:separator():button{text = "Cancel"}

    return dialog;
end

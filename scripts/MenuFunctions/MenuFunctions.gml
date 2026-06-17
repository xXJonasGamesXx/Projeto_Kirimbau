/// @desc Menu - makes a menu, options provided in the form [["name", function, argument], [...]]
function Menu(_x, _y, _options, _description = -1, _width = undefined, _height = undefined)
{
	with (instance_create_depth(_x, _y, -99999, oMenu))
	{
		options = _options;
		description = _description;
		var _optionsCount = array_length(_options);
		visibleOptionsMax = _optionsCount;
		
		//Set up size
		xmargin = 10;
		ymargin = 8;
		draw_set_font(fnt_batalha);
		heightLine = 12;
		
		//Auto width
		if (_width == undefined)
		{
			width = 1;
			if (description != -1) width = max(width, string_width(_description));
			for (var i = 0; i < _optionsCount; i++)
			{
				width = max(width, string_width(_options[i][0]));
			}
			widthFull = width + xmargin * 2;
		} else widthFull = _width;
		
		//Auto height
		if (_height == undefined)
		{
			height = heightLine * (_optionsCount + !(description == -1));
			heightFull = height + ymargin * 2;
		}
		else
		{
			heightFull = _height;
			//scrolling?
			if (heightLine * (_optionsCount + !(description == -1)) > _height - (ymargin*2))
			{
				scrolling = true;
				visibleOptionsMax = (_height - ymargin * 2) div heightLine;
			}
		}
	}
}

function SubMenu(_options)
{
	//store old options in array and increase submenu level
	optionsAbove[subMenuLevel] = options;
	subMenuLevel++;
	options = _options;
	hover = 0;
}

function MenuGoBack()
{
	subMenuLevel--;
	options = optionsAbove[subMenuLevel];
	hover = 0;
}

function MenuSelectAction(_user, _action)
{
    with (oMenu) active = false;
    
    // Pega o primeiro monstro vivo para ser o alvo
    var _target = oBattle.enemyUnits[0]; // Ou apenas enemyUnits[0] dependendo de como você chamou a array no oBattle
    
    // Passa o alvo pro ataque em vez do _user!
    with (oBattle) BeginAction(_user, _action, _target); 
    
    with (oMenu) instance_destroy();
}
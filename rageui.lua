RMenu.Add(cat, name, RageUI.CreateMenu(menu.title,menu.desc))
RMenu:Get(cat, name).Closed = function()end

RMenu.Add(cat, name, RageUI.CreateSubMenu(RMenu:Get(fromcat, fromname), title, desc))
RMenu:Get(cat, name).Closed = function()end

RageUI.Visible(RMenu:Get(cat,name), state)

RageUI.IsVisible(RMenu:Get(cat,name),true,true,true,function()
end, function()end, 1)

RageUI.ButtonWithStyle(title, desc, {}, state,function(h,a,s)end)

RageUI.List(title, array, arrayIndex, desc, {}, state, function(h, a, s, i) arrayIndex = i end)

RageUI.Checkbox(title, desc, bol, { Style = RageUI.CheckboxStyle.Tick }, function(h, s, a, c)
  bol = c;
end, function()
  -- true
end, function()
  -- false
end)

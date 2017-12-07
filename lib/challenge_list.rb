def challenge_list
  list = [
    {name: "Sell Girl Scout Cookies", stat: ["charisma"]},
    {name: "Eat McDonalds Sandwiches", stat: ["stamina"]},
    {name: "Win a Drag Race", stat: ["dexterity"]},
    {name: "Settle a Disagreement", stat: ["wisdom", "charisma"]},
    {name: "House-sit for You", stat: ["wisdom"]},
    {name: "Win a Boxing Match", stat: ["strength"]},
    {name: "Downhill Ski", stat: ["dexterity", "stamina"]},
    {name: "Have Dinner With Your Parents", stat: ["intelligence", "charisma"]},
    {name: "Paint Your Portait", stat: ["intelligence", "dexterity"]}
  ]
  list.shuffle
end

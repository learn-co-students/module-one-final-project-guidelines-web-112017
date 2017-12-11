def challenge_list
  list = [
    {name: "SELL GIRL SCOUT COOKIES", stat: ["charisma"]},
    {name: "EAT MCDONALDS SANDWICHES", stat: ["stamina"]},
    {name: "WIN A DRAG RACE", stat: ["dexterity"]},
    {name: "SETTLE A DISAGREEMENT", stat: ["wisdom", "charisma"]},
    {name: "HOUSE-SIT FOR YOU", stat: ["wisdom"]},
    {name: "WIN A BOXING MATCH", stat: ["strength"]},
    {name: "DOWNHILL SKI", stat: ["dexterity", "stamina"]},
    {name: "HAVE DINNER WITH YOUR PARENTS", stat: ["intelligence", "charisma"]},
    {name: "PAINT YOUR PORTAIT", stat: ["intelligence", "dexterity"]}
  ]
  list.shuffle
end

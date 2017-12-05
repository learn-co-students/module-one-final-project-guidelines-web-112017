require_relative '../config/environment'


welcome

loop
  what to do (create, read, update, delete)
  if create
=>  create weapon but dont save
    ask if they want save
      if no
        leave
      if yes
        save
  if read
    what want to read
    execute

  if update
     save changes


end

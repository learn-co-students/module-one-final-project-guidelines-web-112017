# Project Title

Poll Position is an app that allows residents of New York City to find their current election polling place based on their primary residence, then create, modify, and delete reviews of it.

## Getting Started

Clone the repository to your local machine, and from your terminal, navigate to the local Poll Position directory and ruby bin/run.rb to get started!

### Prerequisites

Poll Position runs on Ruby 2.3, and will require and prompt for installation of the following Ruby Gems:

```
gem "sinatra-activerecord"
gem "sqlite3"
gem "require_all"
gem "rest-client"
gem 'json'
```

Please type "Bundle Install" when prompted to acknowledge and install these items.

## Commands

MAIN MENU
The following is a list of case-insensitive main menu commands:
"Sign In","Create Account", "Add a Residence", "Find My Polling Place", "Review My Polling Place", "My Polling Place Reviews", "Delete My Last Review", "Exit"

sign in -- existing users will be prompted to enter a user id
create account -- new users will be led through a series of prompts to create an account
add a residence -- members can declare a new primary residence.
find my polling place -- members with a declared primary residence can find information on their currrent polling place
review my polling place -- members will be led through a series of prompts to create a review of their current polling place
my polling place reviews -- members can see all reviews they've created
delete my last review -- members can delete their last review
sign out -- signs out current userq
exit -- exits program

## Built With

* [Bundler](https://bundler.io/) - Dependency Management.  Do for a brah.
* [Sinatra-Active Record](https://rubygems.org/gems/sinatra-activerecord) - Extending Sinatra with Active Record Helpers

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

Pssh.

## Authors

* **Eric Lum** - *Initial work* - (https://github.com/eal6gf)
* **Shahin Motia** - *Initial work* - [PurpleBooth](https://github.com/nspp99b)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [App_LICENSE.md](App_LICENSE.md) file for details

## Acknowledgments

* Flatiron School Module One - Final Project
* Poll Position:  If you See Something, Say Something

# World War II Weapons Finder

World War II Weapons Finder is a command line application that searches through various weapons used in World War II. This CLI uses associations between Weapons, Countries, and Types of Weapons. Each weapon also potentially has three characteristics. This CLI will ask for User input, and provide information about weapons based off of the input.

## Using the application
In this application, a User is able to pick a list of countries, weapons, or category of weapons.If a User selects a list of countries, they can find the following information:

- All weapons
- All types
- Show most popular type of weapon
- Show weapon with highest caliber
- Show heaviest weapon
- Show weapon with longest range

If a User selects a list of weapons, they can find the following information:

- Show country
- Show type of weapon
- Show characteristics of that weapon

If a User selects a list of categories, they can find the following information:

- All weapons
- All countries
- What country has the most of this type?
- Which weapon of this type has the lowest caliber?
- Which weapon of this type has the lightest weight?
- Which weapon of this type has the shortest range?

## Installation Instructions
In order you use this application
1. Open your terminal and change your directory to the root of the app.
2. Run `bundle install` to install all required gems

To start the application type `ruby bin/run.rb`

## Contributor's Guide
 Before working with this application, you will need to run `bundle install` which will download the following gems:
  1. sinatra-activerecord
  2. sqlite3
  3. pry
  4. require_all
  5. rake
  6. nokogiri

  Of these gems, the most important gem was Nokogiri, because it was required to scrape https://ww2db.com/, which is where we retrieved information about the weapons to seed the database. If you wanted to add more characteristics for each weapon, you could modify the following code in 'lib/scraper.rb'.

  ```
  code.each_with_index do |x,i|
    if x.text == "NAME OF ATTRIBUTE"
      puts "Getting values for #{hash[:name]}"
      hash[:NAME OF ATTRIBUTE] = code[i+1].text
    end

    ...

  end
  ```
## License
World War II Weapons Finder is released under the MIT License:

- https://opensource.org/licenses/MIT

## Video Demonstration 

- https://www.youtube.com/watch?v=o09KS8KTM-A&feature=youtu.be

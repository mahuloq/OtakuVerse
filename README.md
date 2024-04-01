<a href="https://discord.gg/xay6yPavuS">
  <img alt="Discord" src="https://img.shields.io/discord/1223802253010407516">
</a>

Click here to join the projects discord.


![GitHub forks](https://img.shields.io/github/forks/mahuloq/OtakuVerse)  ![GitHub License](https://img.shields.io/github/license/mahuloq/OtakuVerse) ![GitHub Repo stars](https://img.shields.io/github/stars/mahuloq/OtakuVerse) ![GitHub Issues or Pull Requests](https://img.shields.io/github/issues/mahuloq/OtakuVerse)




# Otakuverse Backend

Otakuverse is the backend of the Otakuverse project. The frontend of which can be found here

https://github.com/mahuloq/fe_OtakuVerse

The Otakuverse project was made to provide a more community managed version of an anime database. Otakuverse allows users to add and edit animes, upload images, create cast a crews with links to the shows they have worked on. It also allows rating of shows and uses rankings provided by users to provide a daily updated top anime list. 

## Features
Controllers to add and delete the following

1. Animes
2. Genres
3. Cast and Crew
4. Ratings
5. Reviews
6. Comments
7. Users
8. Anime Lists
9. Profiles

## Testing

Has tests for most of the controllers and features. Initate them by typing 

```bash
bundle exec rspec
```
## Installation

1. Fork this repository.
2. Clone your repository to your local environment.
3. Run the following to install all required dependencies.
```bash
bundle install
```
4. Change the environments provided to your specific development or production environments.
5. Generate a master key

## Usage
```bash
rails db:migrate
rails db:seed
rails s
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[GNU GPLv3](https://choosealicense.com/licenses/gpl-3.0/#)

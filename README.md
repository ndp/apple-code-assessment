## Local Development

To set things up:

1. Get the normal Rails stuff up and going. All default Rails commands work as expected, but in particular, these commands are relevant:
   ```bash
    $ bundle install
    $ rails webpacker:install
    $ rake db:migrate
   ```
   The database and webpack are not used (yet), but it is much easier to include them now rather than later. (I usually don't take this approach, but in Rails it's easier).
2. You'll need to go to [Visual Crossing](https://www.visualcrossing.com/weather-api) and sign up for a free account to get an API key. Then you'll need to set an environmental variable with your API key, using the name `VISUAL_CROSSING_API_KEY`. The `dotenv` gem is configured if you'd like to use that (but it's not required).

3. To run, you'll use `rails s` as usual. 

4. All default Rails command should work, like `rails test`.

### With Docker
(Optional) Use `./dev.sh` to get into a development terminal without having to futz around with Ruby versions and gemsets. This puts you into a shell in a VM where you do all the normal Rails stuff: `bundle`, `rails start`, etc. 

So that the app will be accessible locally, use `rails s -b 0.0.0.0` to run from inside the VM.

Note: It provides a clean environment if you exit and re-enter with `./dev.sh`. 

## Configuration


## Notes

The `/model` tests should be relocated, but I didn't want to "overengineer" it... there's good conversations about (1) where non-DB models go (2) where services, like the weather api client go. A discussion should be had.


Requirements:
  - [x] Must be done in Ruby on Rails
  - [ ] Accept an (street) address as input
  - [ ] Retrieve forecast data for the given address. This should include, at minimum, the
current temperature (Bonus points - Retrieve high/low and/or extended forecast)
  - [ ] Display the requested forecast details to the user
  - [ ] Cache the forecast details for 30 minutes for all subsequent requests by zip codes.
Display indicator if result is pulled from cache.
Assumptions:
  - [ ] This project is open to interpretation
  - [ ] Functionality is a priority over form
  - [x] If you get stuck, complete as much as you can
Submission:
  - [ ] Use a public source code repository (GitHub, etc) to store your code
  - [ ] Send us the link to your completed code
Reminders:
Please remember it’s not just whether or not the code works that they will be focused on
seeing it’s all the rest of what goes into good Senior Software Engineering daily practices
for Enterprise Production Level Code – such as specifically:
  - [x] Unit Tests (#1 on the list of things people forget to include – so please remember, treat
this as if it were true production level code, do not treat it just as an exercise),
  - [x] Detailed Comments/Documentation within the code, also have a README file
  - [x] Include *Decomposition* of the Objects in the Documentation
  - [x] Design Patterns (if/where applicable)
  - [x] Scalability Considerations (if applicable)
  - [x] Naming Conventions (name things as you would name them in enterprise-scale
production code environments)
  - [x] Encapsulation, (don’t have 1 Method doing 55 things)
  - [x] Code Re-Use, (don’t over-engineer the solution, but don’t under-engineer it either)
  - [x] and any other industry Best Practices.
  - [x] Remember to Include the UI ***
  - [x] No not use ChatGPT/AI
Lots of stuff not done that would be needed for a production app:
  - [ ] Rate-limit / ddos protection
  - [ ] Traceability/logging
  - [ ] Deployment configuration



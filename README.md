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


## Notes

There's a request to "Include the UI", which I'm not sure what that means. I've included the simplest forms imaginable to get the job done. I have lots of "UI" code, if you're interested. Just one example, [Amp What](https://www.amp-what.com/) is all my code. I'm happy to walk through various projects and share code.

I TDDed all the code. There could be a happy-path integration test, but as the UI is pretty likely to change if this project is picked up, that seems premature.

For the "industry best practices", I've tried to stick to the Rails conventions as much as possible. Obviously there are other directions to go. I'm unsure about where to put the service code for the weather API. Maybe Rails now has a good place for this (I'm not 100% up to date), but it's hanging out in a `api` directory, and the tests are orphaned in the model directory. Perhaps the `/model` tests should be relocated, but I didn't want to "overengineer", or fight with Rails conventions too much... there's good conversations about (1) where non-DB model (WeatherResult) should be located (2) where services, like the weather api client go. A discussion should be had.

The code is not caching by "zip codes", but rather, just a compressed form of the address. The user input and backing API do not require a zip code, and accepts things like 'New York' or "Anchorage' and still gives valid results. I've tried to at least allude to the need for a good cache key with the architecture. If you refresh the page a lot, it pulls the result from the cache, which I think is what you want to see.

If zip code caching is a hard requirement, a separate API call, to a different service, would need to be used to resolve the address to a zip code, and then a call to the weather API with the zip code. I'd want to think over whether this would be better for the user, but on first blush it doesn't seem so. 

I've included minimal scalability considerations. It seems unlikely this project will receive a lot of traffic (as it's just a little test project), so it seems properly engineered. One the high-volume sites I've worked on, the code changes quite a bit, and the standard Rails conventions are not always followed. I'm not sure what you're really looking for, but happy to discuss some of the trickier issues I've dealt with with high-volume, consumer-facing sites.

To send this into production, you'd need need these things at first:
- [ ] Rate-limit / ddos protection (mostly just adding a gem)
- [ ] CI
- [ ] Deployment configuration
- [ ] Monitoring/traceability/logging


## Requirements

  - [x] Must be done in Ruby on Rails
  - [x] Accept an (street) address as input
  - [x] Retrieve forecast data for the given address. This should include, at minimum, the
current temperature (Bonus points - Retrieve high/low and/or extended forecast)
  - [x] Display the requested forecast details to the user
  - [ ] Cache the forecast details for 30 minutes for all subsequent requests by zip codes.
  - [x] Display indicator if result is pulled from cache.
Assumptions:
  - [x] This project is open to interpretation
  - [x] Functionality is a priority over form
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



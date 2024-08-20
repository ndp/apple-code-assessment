## Local Development

- All default Rails commands work as expected.
- To get started,
   ```bash
    $ bundle install
    $ rails webpacker:install
  ```

### With Docker
(Optional) Use `./dev.sh` to get into a development terminal without having to futz around with Ruby versions and gemsets. This puts you into a shell in a VM where you do all the normal Rails stuff: `bundle`, `rails start`, etc. 

So that the app will be accessible locally, use `rails s -b 0.0.0.0` to run from inside the VM.

Note: It provides a clean environment if you exit and re-enter with `./dev.sh`. 

* Configuration
* Database creation
* Database initialization
* How to run the test suite


Requirements:
  - [x] Must be done in Ruby on Rails
  - [ ] Accept an address as input
  - [ ] Retrieve forecast data for the given address. This should include, at minimum, the
current temperature (Bonus points - Retrieve high/low and/or extended forecast)
  - [ ] Display the requested forecast details to the user
  - [ ] Cache the forecast details for 30 minutes for all subsequent requests by zip codes.
Display indicator if result is pulled from cache.
Assumptions:
  - [ ] This project is open to interpretation
  - [ ] Functionality is a priority over form
  - [ ] If you get stuck, complete as much as you can
Submission:
  - [ ] Use a public source code repository (GitHub, etc) to store your code
  - [ ] Send us the link to your completed code
Reminders:
Please remember it’s not just whether or not the code works that they will be focused on
seeing it’s all the rest of what goes into good Senior Software Engineering daily practices
for Enterprise Production Level Code – such as specifically:
  - [ ] Unit Tests (#1 on the list of things people forget to include – so please remember, treat
this as if it were true production level code, do not treat it just as an exercise),
  - [ ] Detailed Comments/Documentation within the code, also have a README file
  - [ ] Include *Decomposition* of the Objects in the Documentation
  - [ ] Design Patterns (if/where applicable)
  - [ ] Scalability Considerations (if applicable)
  - [ ] Naming Conventions (name things as you would name them in enterprise-scale
production code environments)
  - [ ] Encapsulation, (don’t have 1 Method doing 55 things)
  - [ ] Code Re-Use, (don’t over-engineer the solution, but don’t under-engineer it either)
  - [ ] and any other industry Best Practices.
  - [ ] Remember to Include the UI ***
  - [ ] No not use ChatGPT/AI




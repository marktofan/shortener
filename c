.F

Failures:

  1) Ability User can create new Link .
     Failure/Error: should be_able_to(:create, Link.new(url: 'http://www.google.ro', user: user))
     ActiveModel::MassAssignmentSecurity::Error:
       Can't mass-assign protected attributes: user
     # ./spec/models/ability_spec.rb:32:in `new'
     # ./spec/models/ability_spec.rb:32:in `block (3 levels) in <top (required)>'

Finished in 0.27975 seconds
2 examples, 1 failure

Failed examples:

rspec ./spec/models/ability_spec.rb:27 # Ability User can create new Link .

Randomized with seed 4265


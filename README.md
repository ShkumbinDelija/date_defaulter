# DateDefaulter

![Gem Downloads](https://rubygem-badges.onrender.com/gems/date_defaulter.png)
![Gem Version](https://badge.fury.io/rb/date_defaulter.svg)

Use this gem to set global defaults on how your Date is formatted when represented as a string.

## Install
    gem install date_defaulter
## Usage
```ruby

include DateDefaulter

# You can set the configuration directly
DateDefaulter.format = '%d/%m/%Y'
# or using a block
DateDefaulter.configuration do |configuration|
  configuration.format = '%d/%m/%Y'
end

date = Date.new(2016, 10, 21)

p date

=> "21/10/2016"

p date.strftime

=> "21/10/2016"
```
## License
MIT

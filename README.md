# DateDefaulter
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

=> "01/01/2022"

p date.strftime

=> "21/10/2016"
```
## License
MIT
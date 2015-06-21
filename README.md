# gyazotra

Simple sinatra Gyazo server on Heroku/S3

## Usage

Set environment variables below and start server.

```
bundle exec rackup
```

Download [Gyazo](https://gyazo.com/ja) and open `/Applications/Gyazo.app/Contents/Resources/script`,
change `HOST` to your server, `CGI` to `/`.

Capture!

## ENV

```
S3_BUCKET - S3 bucket name
AWS_ACCESS_KEY_ID - AWS access key id
AWS_SECRET_ACCESS_KEY - AWS secret access key
```

## Contributing

1. Fork it ( https://github.com/bitjourney/gyazotra/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

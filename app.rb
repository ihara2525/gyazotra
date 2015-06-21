require 'aws-sdk-core'

class App < Sinatra::Base
  register Sinatra::Reloader

  post '/' do
    object = s3_bucket.object(filename(params))
    object.upload_file(params[:imagedata][:tempfile], acl: acl)
    object.public_url
  end

  private

  def s3
      @s3 ||= Aws::S3::Resource.new(region: 'ap-northeast-1',
                                    credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']))
  end

  def s3_bucket
    @s3_bucket ||= begin
      s3_bucket = s3.bucket(ENV['S3_BUCKET'])
      s3_bucket = s3.create_bucket(bucket: ENV['S3_BUCKET']) unless s3_bucket.exists?
      s3_bucket
    end
  end

  def filename(params)
    if params[:imagedata][:filename] == 'gyazo.com'
      extname = '.png'
    else
      extname = File.extname(params[:imagedata][:original_filename])
    end
    Time.now.to_f.to_s.delete('.') + extname
  end

  def acl
    'public-read'
  end
end

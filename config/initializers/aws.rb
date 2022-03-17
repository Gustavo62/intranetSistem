Aws.config.update({
    region: 'us-east-1',
    credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
    #credentials: Aws::Credentials.new('AKIA4OI3WR5SH7JBBTA2','dhshR9ri1EKARMBJTgXvSi3YPw9x/PDAFdq0nuC3'),
  })
  
  S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['S3_BUCKET'])
  #S3_BUCKET = Aws::S3::Resource.new.bucket('intranet-anoreg-heroku')
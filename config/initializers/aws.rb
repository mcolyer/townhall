AWS::S3::Base.establish_connection!(
    :access_key_id     => TownhallConfig.s3_access_key,
    :secret_access_key => TownhallConfig.s3_secret_key
)

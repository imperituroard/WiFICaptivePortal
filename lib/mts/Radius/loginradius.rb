@LoginRadiusConfig = {
    :sitename => 'LOGINRADIUS_SITENAME',
    :appkey => 'LOGINRADIUS_APPKEY',
    :appsecret => 'LOGINRADIUS_APPSECRET',
    :objectId => 'LOGINRADIUS_OBJECTID'
}

@userRegister = LoginRadiusRaas::RaasApi.new(@LoginRadiusConfig);

@access_token = @userRegister.get_access_token(params[:token])

@userRegister.get_user_profile(@access_token[:access_token])
#=>object of full user profile data

params = {
    :emailid => "example@example.com",
    :password => "FakePass",
    :firstname => "Joe",
    :lastname => "Smith",
    :gender => "M",
    :birthdate => "11-08-1987",
    :Country => "USA",
    :city => "Chicago",
    :state => "Illinois ",
    :phonenumber => "1232333232",
    :address1 => "23/43, II Street",
    :address2 => "Near Paris garden",
    :company => "Orange Inc.",
    :postalcode => "43435",
    :emailsubscription => "true",
    :customfields => {
        :example_field1 => "some data 1",
        :example_field2 => "some data 2",
        :example_field3 => "some data 3"
    }
}

@userRegister.user_create_profile(params)



params = {
    :emailid => "example@example.com",
    :password => "FakePass",
    :firstname => "Joe",
    :lastname => "Smith",
    :gender => "M",
    :birthdate => "11-08-1987",
    :Country => "USA",
    :city => "Chicago",
    :state => "Illinois ",
    :phonenumber => "1232333232",
    :address1 => "23/43, II Street",
    :address2 => "Near Paris garden",
    :company => "Orange Inc.",
    :postalcode => "43435",
    :emailsubscription => "true",
    :customfields => {
        :example_field1 => "some data 1",
        :example_field2 => "some data 2",
        :example_field3 => "some data 3",
    },
    :EmailVerificationUrl => "http://yoursite.com/verifyemail"
}
@userRegister.user_registration(params)




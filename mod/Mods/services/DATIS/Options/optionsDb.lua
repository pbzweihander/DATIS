local DbOption = require("Options.DbOption")

return {
  defaultVoice = DbOption.new():setValue("WIN"):combo({
    DbOption.Item(_("Windows integrated TTS")):Value("WIN"),

    DbOption.Item(_("GCloud: en-AU-Standard-A")):Value("GC:en-AU-Standard-A"),
    DbOption.Item(_("GCloud: en-AU-Standard-B")):Value("GC:en-AU-Standard-B"),
    DbOption.Item(_("GCloud: en-AU-Standard-C")):Value("GC:en-AU-Standard-C"),
    DbOption.Item(_("GCloud: en-AU-Standard-D")):Value("GC:en-AU-Standard-D"),
    DbOption.Item(_("GCloud: en-AU-Wavenet-A")):Value("GC:en-AU-Wavenet-A"),
    DbOption.Item(_("GCloud: en-AU-Wavenet-B")):Value("GC:en-AU-Wavenet-B"),
    DbOption.Item(_("GCloud: en-AU-Wavenet-C")):Value("GC:en-AU-Wavenet-C"),
    DbOption.Item(_("GCloud: en-AU-Wavenet-D")):Value("GC:en-AU-Wavenet-D"),
    DbOption.Item(_("GCloud: en-IN-Standard-A")):Value("GC:en-IN-Standard-A"),
    DbOption.Item(_("GCloud: en-IN-Standard-B")):Value("GC:en-IN-Standard-B"),
    DbOption.Item(_("GCloud: en-IN-Standard-C")):Value("GC:en-IN-Standard-C"),
    DbOption.Item(_("GCloud: en-IN-Standard-D")):Value("GC:en-IN-Standard-D"),
    DbOption.Item(_("GCloud: en-IN-Wavenet-A")):Value("GC:en-IN-Wavenet-A"),
    DbOption.Item(_("GCloud: en-IN-Wavenet-B")):Value("GC:en-IN-Wavenet-B"),
    DbOption.Item(_("GCloud: en-IN-Wavenet-C")):Value("GC:en-IN-Wavenet-C"),
    DbOption.Item(_("GCloud: en-IN-Wavenet-D")):Value("GC:en-IN-Wavenet-D"),
    DbOption.Item(_("GCloud: en-GB-Standard-A")):Value("GC:en-GB-Standard-A"),
    DbOption.Item(_("GCloud: en-GB-Standard-B")):Value("GC:en-GB-Standard-B"),
    DbOption.Item(_("GCloud: en-GB-Standard-C")):Value("GC:en-GB-Standard-C"),
    DbOption.Item(_("GCloud: en-GB-Standard-D")):Value("GC:en-GB-Standard-D"),
    DbOption.Item(_("GCloud: en-GB-Standard-F")):Value("GC:en-GB-Standard-F"),
    DbOption.Item(_("GCloud: en-GB-Wavenet-A")):Value("GC:en-GB-Wavenet-A"),
    DbOption.Item(_("GCloud: en-GB-Wavenet-B")):Value("GC:en-GB-Wavenet-B"),
    DbOption.Item(_("GCloud: en-GB-Wavenet-C")):Value("GC:en-GB-Wavenet-C"),
    DbOption.Item(_("GCloud: en-GB-Wavenet-D")):Value("GC:en-GB-Wavenet-D"),
    DbOption.Item(_("GCloud: en-GB-Wavenet-F")):Value("GC:en-GB-Wavenet-F"),
    DbOption.Item(_("GCloud: en-US-Standard-B")):Value("GC:en-US-Standard-B"),
    DbOption.Item(_("GCloud: en-US-Standard-C")):Value("GC:en-US-Standard-C"),
    DbOption.Item(_("GCloud: en-US-Standard-D")):Value("GC:en-US-Standard-D"),
    DbOption.Item(_("GCloud: en-US-Standard-E")):Value("GC:en-US-Standard-E"),
    DbOption.Item(_("GCloud: en-US-Standard-G")):Value("GC:en-US-Standard-G"),
    DbOption.Item(_("GCloud: en-US-Standard-H")):Value("GC:en-US-Standard-H"),
    DbOption.Item(_("GCloud: en-US-Standard-I")):Value("GC:en-US-Standard-I"),
    DbOption.Item(_("GCloud: en-US-Standard-J")):Value("GC:en-US-Standard-J"),
    DbOption.Item(_("GCloud: en-US-Wavenet-A")):Value("GC:en-US-Wavenet-A"),
    DbOption.Item(_("GCloud: en-US-Wavenet-B")):Value("GC:en-US-Wavenet-B"),
    DbOption.Item(_("GCloud: en-US-Wavenet-C")):Value("GC:en-US-Wavenet-C"),
    DbOption.Item(_("GCloud: en-US-Wavenet-D")):Value("GC:en-US-Wavenet-D"),
    DbOption.Item(_("GCloud: en-US-Wavenet-E")):Value("GC:en-US-Wavenet-E"),
    DbOption.Item(_("GCloud: en-US-Wavenet-F")):Value("GC:en-US-Wavenet-F"),
    DbOption.Item(_("GCloud: en-US-Wavenet-G")):Value("GC:en-US-Wavenet-G"),
    DbOption.Item(_("GCloud: en-US-Wavenet-H")):Value("GC:en-US-Wavenet-H"),
    DbOption.Item(_("GCloud: en-US-Wavenet-I")):Value("GC:en-US-Wavenet-I"),
    DbOption.Item(_("GCloud: en-US-Wavenet-J")):Value("GC:en-US-Wavenet-J"),

    DbOption.Item(_("AWS: Nicole (en-AU)")):Value("AWS:Nicole"),
    DbOption.Item(_("AWS: Olivia (en-AU)")):Value("AWS:Olivia"),
    DbOption.Item(_("AWS: Russell (en-AU)")):Value("AWS:Russell"),
    DbOption.Item(_("AWS: Amy (en-GB)")):Value("AWS:Amy"),
    DbOption.Item(_("AWS: Emma (en-GB)")):Value("AWS:Emma"),
    DbOption.Item(_("AWS: Brian (en-GB)")):Value("AWS:Brian"),
    DbOption.Item(_("AWS: Aditi (en-IN)")):Value("AWS:Aditi"),
    DbOption.Item(_("AWS: Raveena (en-IN)")):Value("AWS:Raveena"),
    DbOption.Item(_("AWS: Ivy (en-US)")):Value("AWS:Ivy"),
    DbOption.Item(_("AWS: Joanna (en-US)")):Value("AWS:Joanna"),
    DbOption.Item(_("AWS: Kendra (en-US)")):Value("AWS:Kendra"),
    DbOption.Item(_("AWS: Kimberly (en-US)")):Value("AWS:Kimberly"),
    DbOption.Item(_("AWS: Salli (en-US)")):Value("AWS:Salli"),
    DbOption.Item(_("AWS: Joey (en-US)")):Value("AWS:Joey"),
    DbOption.Item(_("AWS: Justin (en-US)")):Value("AWS:Justin"),
    DbOption.Item(_("AWS: Kevin (en-US)")):Value("AWS:Kevin"),
    DbOption.Item(_("AWS: Matthew (en-US)")):Value("AWS:Matthew"),
    DbOption.Item(_("AWS: Geraint (en-US)")):Value("AWS:Geraint"),
  }),
  gcloudAccessKey = DbOption.new():setValue(""):editbox(),
  awsAccessKey = DbOption.new():setValue(""):editbox(),
  awsPrivateKey = DbOption.new():setValue(""):editbox(),
  -- see https://docs.aws.amazon.com/general/latest/gr/rande.html#pol_region for regions polly is available in
  awsRegion = DbOption.new():setValue("eu-central-1"):combo({
    DbOption.Item(_("ap-northeast-1")):Value("ap-northeast-1"),
    DbOption.Item(_("ap-northeast-2")):Value("ap-northeast-2"),
    DbOption.Item(_("ap-south-1")):Value("ap-south-1"),
    DbOption.Item(_("ap-southeast-1")):Value("ap-southeast-1"),
    DbOption.Item(_("ap-southeast-2")):Value("ap-southeast-2"),
    DbOption.Item(_("ca-central-1")):Value("ca-central-1"),
    DbOption.Item(_("cn-northwest-1")):Value("cn-northwest-1"),
    DbOption.Item(_("eu-central-1")):Value("eu-central-1"),
    DbOption.Item(_("eu-north-1")):Value("eu-north-1"),
    DbOption.Item(_("eu-west-1")):Value("eu-west-1"),
    DbOption.Item(_("eu-west-2")):Value("eu-west-2"),
    DbOption.Item(_("eu-west-3")):Value("eu-west-3"),
    DbOption.Item(_("sa-east-1")):Value("sa-east-1"),
    DbOption.Item(_("us-east-1")):Value("us-east-1"),
    DbOption.Item(_("us-east-2")):Value("us-east-2"),
    DbOption.Item(_("us-gov-west-1")):Value("us-gov-west-1"),
    DbOption.Item(_("us-west-1")):Value("us-west-1"),
    DbOption.Item(_("us-west-2")):Value("us-west-2"),
  }),
  srsPort = DbOption.new():setValue("5002"):editbox(),
  debugLoggingEnabled = DbOption.new():setValue(false):checkbox()
}

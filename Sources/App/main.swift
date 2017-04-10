import Vapor
import TwilioAccessToken
import Environment

let drop = Droplet()

drop.get("token") { request in
  guard let device = request.data["device"]?.string,
        let accountSid = Env["TWILIO_ACCOUNT_SID"],
        let signingKeySid = Env["TWILIO_SIGNING_KEY"],
        let secret = Env["TWILIO_SECRET"] else {
          throw Abort.badRequest
  }

  let identity = names.randomElement()

  var accessToken = TwilioAccessToken(
    accountSid: accountSid,
    signingKeySid: signingKeySid,
    secret: secret
  )

  accessToken.identity = identity

  var chatGrant = IpMessagingGrant()
  chatGrant.serviceSid = Env["IPM_SERVICE_SID"]
  chatGrant.endpointId = "TwilioChat:\(identity):\(device)"

  accessToken.addGrant(chatGrant)

  let responseDictionary = [
    "identity": identity,
    "token": accessToken.toJwt()
  ]

  return try JSON(node: responseDictionary)
}

drop.get("/") { request in
  return try drop.view.make("index.html")
}

drop.run()

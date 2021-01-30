
# -------------------- EDIT THESE VARIABLES -------------------- #
$IMAGE_URL    = "https://i.imgur.com/X8hiPwF.jpg"
$API_ENDPOINT = "https://westcentralus.api.cognitive.microsoft.com/vision"
$API_KEY      = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
# -------------------------------------------------------------- #

$FEATURES = "Adult,Categories,Description"
$DETAILS  = "Celebrities"
$URI      = "$($API_ENDPOINT)/v3.1/analyze?visualFeatures=$($FEATURES)&details=$($DETAILS)"
$headers  = @{"Ocp-Apim-Subscription-Key"="$($API_KEY)"}
$body     = "{'url':'$($IMAGE_URL)'}"

$response = Invoke-WebRequest -Uri $URI `
                              -Headers $headers `
                              -ContentType "application/json" `
                              -Body $body `
                              -Method Post

$imageInfo = $response.Content | ConvertFrom-Json
$imageInfo | ConvertTo-Json -Depth 99
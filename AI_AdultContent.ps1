
# -------------------- EDIT THESE VARIABLES -------------------- #
$IMAGE_URL    = "https://i.imgur.com/X8hiPwF.jpg"
$API_ENDPOINT = "ai-test-demo.cognitiveservices.azure.com"
$API_KEY      = "d47c80d392af43fd84cd4454a292bc51"
# -------------------------------------------------------------- #

$FEATURES = "Adult,Categories,Description"
$DETAILS  = "Celebrities"
$URI      = "https://$($API_ENDPOINT)/vision/v3.1/analyze?visualFeatures=$($FEATURES)&details=$($DETAILS)"
$headers  = @{"Ocp-Apim-Subscription-Key"="$($API_KEY)"}
$body     = "{'url':'$($IMAGE_URL)'}"

$response = Invoke-WebRequest -Uri $URI `
                              -Headers $headers `
                              -ContentType "application/json" `
                              -Body $body `
                              -Method Post

$imageInfo = $response.Content | ConvertFrom-Json
$imageInfo | ConvertTo-Json -Depth 99
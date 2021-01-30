using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)



$return_code = $Request.Query.response_code

if(-not($return_code)){
    $return_code = 403
    $body = @{
        'status' = 'no http return code submitted - use the query parameter response_code with a valid http response'
    }
} else {
    [int]$return_code = $return_code
    $body = @{
        'status' = $return_code
    }
}


Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = $return_code
    Body = $body
})

$organization = "swisscsurockstars"
$project = "Demo%20-%20DevOps"
$pipelineId = "45"
$runId = "775"
$pat = "5DGMbUyWK7jeXMTbHgTeL9Etc1BmhkFSjF6habNxrU8B6bgmUuSeJQQJ99AKACAAAAAAArohAAASAZDOOdNg"

$headers = @{
    Authorization = "Basic " + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$pat"))
    Accept        = "application/json"
}

#$url = "https://dev.azure.com/$organization/$project/_apis/pipelines/$pipelineId/runs?api-version=6.0"

#$url = "https://dev.azure.com/$organization/$project/_apis/pipelines/$pipelineId/runs/$runId?api-version=7.2"

$url = "https://dev.azure.com/$organization/$project/_apis/pipelines/$pipelineId/runs/$runId/logs?$expand={$expand}&api-version=7.1"
#GET https://dev.azure.com/{organization}/{project}/_apis/pipelines/{pipelineId}/runs/{runId}/logs/{logId}?$expand={$expand}&api-version=7.1

$response = Invoke-RestMethod -Uri $url -Method Get -Headers $headers
$response.value
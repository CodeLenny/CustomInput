# By default, the standalone version loads the latest stable version from my repository.
# If you fork this code, you may wish to change the repository owner in the `if github` section.
# Otherwise, if you create your own copy of this loader, you may wish to alter the version or
# instead reference your copy of the code by setting `github` to false and changing the baseUrl
# in the `else` section.

github = yes

baseUrl = ""

if github
    repo = "CodeLenny"
    version = "0.1" # or replace with a commit hash
    baseUrl = "//cdn.rawgit.com/#{repo}/CustomInput/#{version}/build/"
else
    baseUrl = ""

loadGlobally = yes
checkCallback = yes


requirejs.config
    baseUrl: baseUrl
    paths:
        CustomInput: baseUrl
        requirejs: '//cdn.rawgit.com/jrburke/requirejs/49086cf903410c746140fd968151a8aa95cc3482/'
        jquery: "//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min"

require ["CustomInput/CustomInput"], (CustomInput) ->
    if loadGlobally
        window.CustomInput = CustomInput
    if checkCallback and window.onCustomInput
        window.onCustomInput CustomInputs
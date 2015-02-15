version = "2840429"

requirejs.config
    baseUrl: baseUrl
    paths:
        CustomInput: "//cdn.rawgit.com/CodeLenny/CustomInput/#{version}/build/"
        TrueFalse: "//cdn.rawgit.com/CodeLenny/CustomInput/#{version}/build/example/truefalse/"
        requirejs: '//cdn.rawgit.com/jrburke/requirejs/49086cf903410c746140fd968151a8aa95cc3482/'
        jquery: "//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min"

require ["CustomInput/CustomInput"], (CustomInput) ->
    class TrueFalse extends CustomInput
        constructor: ->
            super yes
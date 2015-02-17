inputVersion = "3be1bbb"
exampleVersion = "a2bbcbf"

requirejs.config
    baseUrl: "//cdn.rawgit.com/CodeLenny/CustomInput/#{inputVersion}/build"
    paths:
        CustomInput: "//cdn.rawgit.com/CodeLenny/CustomInput/#{inputVersion}/build"
        TrueFalse: "//cdn.rawgit.com/CodeLenny/CustomInput/#{exampleVersion}/build/example/truefalse"
        requirejs: '//cdn.rawgit.com/jrburke/requirejs/49086cf903410c746140fd968151a8aa95cc3482'
        jquery: "//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min"

require ["CustomInput/CustomInput", "TrueFalse/Question"], (CustomInput, Question) ->
    class TrueFalse extends CustomInput
        constructor: ->
            @addType Question
            super yes, "True False", "tf"
    window.truefalse = new TrueFalse()
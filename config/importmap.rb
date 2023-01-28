# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@fortawesome/fontawesome-free", to: "https://ga.jspm.io/npm:@fortawesome/fontawesome-free@6.1.2/js/all.js"
pin "youtube-player", to: "https://ga.jspm.io/npm:youtube-player@5.5.2/dist/index.js"
pin "debug", to: "https://ga.jspm.io/npm:debug@2.6.9/src/browser.js"
pin "load-script", to: "https://ga.jspm.io/npm:load-script@1.0.0/index.js"
pin "ms", to: "https://ga.jspm.io/npm:ms@2.0.0/index.js"
pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0/nodelibs/browser/process-production.js"
pin "sister", to: "https://ga.jspm.io/npm:sister@3.0.2/src/sister.js"

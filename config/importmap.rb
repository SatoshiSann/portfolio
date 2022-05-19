# Pin npm packages by running ./bin/importmap

pin_all_from "app/javascript/controllers", under: "controllers"
pin "application", preload: true
pin "vue", to: "https://ga.jspm.io/npm:vue@3.2.26/dist/vue.esm-browser.js"
pin "@vue/reactivity", to: "https://ga.jspm.io/npm:@vue/reactivity@3.2.33/dist/reactivity.esm-bundler.js"
pin "@vue/runtime-core", to: "https://ga.jspm.io/npm:@vue/runtime-core@3.2.33/dist/runtime-core.esm-bundler.js"
pin "@vue/runtime-dom", to: "https://ga.jspm.io/npm:@vue/runtime-dom@3.2.33/dist/runtime-dom.esm-bundler.js"
pin "@vue/shared", to: "https://ga.jspm.io/npm:@vue/shared@3.2.33/dist/shared.esm-bundler.js"
pin "axios", to: "https://ga.jspm.io/npm:axios@0.27.2/index.js"
pin "#lib/adapters/http.js", to: "https://ga.jspm.io/npm:axios@0.27.2/lib/adapters/xhr.js"
pin "#lib/defaults/env/FormData.js", to: "https://ga.jspm.io/npm:axios@0.27.2/lib/helpers/null.js"
pin "buffer", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.24/nodelibs/browser/buffer.js"

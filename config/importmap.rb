# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "vue", to: "https://ga.jspm.io/npm:vue@3.2.26/dist/vue.esm-browser.js"
pin "@vue/reactivity", to: "https://ga.jspm.io/npm:@vue/reactivity@3.2.33/dist/reactivity.esm-bundler.js"
pin "@vue/runtime-core", to: "https://ga.jspm.io/npm:@vue/runtime-core@3.2.33/dist/runtime-core.esm-bundler.js"
pin "@vue/runtime-dom", to: "https://ga.jspm.io/npm:@vue/runtime-dom@3.2.33/dist/runtime-dom.esm-bundler.js"
pin "@vue/shared", to: "https://ga.jspm.io/npm:@vue/shared@3.2.33/dist/shared.esm-bundler.js"

# pin_all_from "app/javascript/controllers", under: "controllers"

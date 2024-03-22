const { defineConfig } = require("cypress");

module.exports = defineConfig({
  e2e: {
    chromeWebSecurity: false,
    testIsolation: false,
    supportFile: false,
    specPattern: ["./*.cy.js"],
  },
});

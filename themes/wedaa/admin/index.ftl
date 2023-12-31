<!DOCTYPE html><html lang="en"><head>
  <meta charset="utf-8">
  <link id="favicon" rel="icon" href="${resourceUrl}/favicon.ico">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="Web site to manage WeDAA identity and access">
  <title>WeDAA Identity and Access management Console</title>

  <style>/* build/index.html.inline.0.css */
.container,
.container-fluid,
#load-container {
  padding: 0;
  margin: 0;
}
.container,
.container-fluid,
#load-container {
  width: 100vw;
}
.keycloak__loading-container {
  height: 100vh;
  width: 100%;
  background-color: #f0f0f0;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  margin: 0;
}
#loading-text {
  z-index: 1000;
  font-size: 20px;
  font-weight: 600;
  padding-top: 32px;
}
</style>
<link rel="stylesheet" href="${resourceUrl}/index.css"></head>

<body style="height: 100%;">
  <div id="app" style="height: 100%">
    <div class="container container-fluid" id="load-container">
      <div class="keycloak__loading-container">
        <span class="pf-c-spinner pf-m-xl" role="progressbar" aria-valuetext="Loading...">
          <span class="pf-c-spinner__clipper"></span>
          <span class="pf-c-spinner__lead-ball"></span>
          <span class="pf-c-spinner__tail-ball"></span>
        </span>
        <div>
          <p id="loading-text">Loading the admin console</p>
        </div>
      </div>
    </div>
  </div>

  <noscript>You need to enable JavaScript to run this app.</noscript>
  <script type="module" src="${resourceUrl}/index.js"></script>
  <!--
    This HTML file is a template.
    If you open it directly in the browser, you will see an empty page.

    You can add webfonts, meta tags, or analytics to this file.
    The build step will place the bundled scripts into the <body> tag.

    To begin the development, run `npm start`.
    To create a production bundle, use `npm run build`.
  -->




  <script id="environment" type="application/json">
    {
      "loginRealm": "${loginRealm!"master"}",
      "authServerUrl": "${authServerUrl}",
      "authUrl": "${authUrl}",
      "consoleBaseUrl": "${consoleBaseUrl}",
      "resourceUrl": "${resourceUrl}",
      "masterRealm": "${masterRealm}",
      "resourceVersion": "${resourceVersion}",
      "commitHash": "5a74705df15032486845518629f36b63c0ee5593",
      "isRunningAsTheme": true
    }
  </script>
</body>

</html>
'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "fcf0c1f67454287afc94b91c2c01cb1b",
"assets/AssetManifest.bin.json": "5fd23c114ff52eceb9b6d6fb47545542",
"assets/AssetManifest.json": "19a190b8d65b8568620c30113fcfe5be",
"assets/assets/fonts/CircularStd-Black.eot": "b9fb083eb9221856b7bf07338d48dea1",
"assets/assets/fonts/CircularStd-Black.ttf": "6b37ec3ab40ff00c70efe9a9770deac0",
"assets/assets/fonts/CircularStd-Black.woff": "b5fa1b553516d1cf8d03d6b4588058a0",
"assets/assets/fonts/CircularStd-Black.woff2": "a7d0eebb9d2e5cc322735d10e8b7f95c",
"assets/assets/fonts/CircularStd-BlackItalic.eot": "06bbad3b4f8620c783d642bd9a8ae58e",
"assets/assets/fonts/CircularStd-BlackItalic.ttf": "02ae5721609a5d2796741881a3625c12",
"assets/assets/fonts/CircularStd-BlackItalic.woff": "2153a12d1db4eda5b954e54532175e5d",
"assets/assets/fonts/CircularStd-BlackItalic.woff2": "8f80cd37b0c3703245260474f4bc89a8",
"assets/assets/fonts/CircularStd-Bold.eot": "05e426849f41db7d1cd89faa1b397698",
"assets/assets/fonts/CircularStd-Bold.ttf": "145ae1e715558908e29811cba088758e",
"assets/assets/fonts/CircularStd-Bold.woff": "6f4fe3ca482221e7c0d8c1baa5f31100",
"assets/assets/fonts/CircularStd-Bold.woff2": "b26584c8d17834161eb3460b00f2affd",
"assets/assets/fonts/CircularStd-BoldItalic.eot": "b43256a8513387f221a5e78d78677d8e",
"assets/assets/fonts/CircularStd-BoldItalic.ttf": "f4a95390a8882cf366a49da0c3f6c889",
"assets/assets/fonts/CircularStd-BoldItalic.woff": "8d5dbe8149820b1202cbaf34b7204598",
"assets/assets/fonts/CircularStd-BoldItalic.woff2": "b88d7b4e2abab9df7bbd23902aa42bbf",
"assets/assets/fonts/CircularStd-Book.eot": "60f92783e3a9b3c8c9f7a4fdb733739d",
"assets/assets/fonts/CircularStd-Book.ttf": "9e31161108ad69cc75264c71274e8a58",
"assets/assets/fonts/CircularStd-Book.woff": "c47d7e581f2a563f8dedd4509c106fb8",
"assets/assets/fonts/CircularStd-Book.woff2": "35e6fb86d66a830d45e377494420c11b",
"assets/assets/fonts/CircularStd-BookItalic.eot": "6ba855cfa69af4b4a1f45772b802437c",
"assets/assets/fonts/CircularStd-BookItalic.ttf": "cdf3e399ae3008a70d37f359914502da",
"assets/assets/fonts/CircularStd-BookItalic.woff": "cc06409e5a820f455b3b4883fbf9b72f",
"assets/assets/fonts/CircularStd-BookItalic.woff2": "8b30196cf402e1b9062b8d67d4d685a0",
"assets/assets/fonts/CircularStd-Medium.eot": "35964d63c32b6f47625cec50a973a02a",
"assets/assets/fonts/CircularStd-Medium.ttf": "e4ba63a6345c96f3cb813ef00340beda",
"assets/assets/fonts/CircularStd-Medium.woff": "e47ea4c0b9151fe6cbd8e2f332113559",
"assets/assets/fonts/CircularStd-Medium.woff2": "0afc4e786e3062a37ea255d7acefba28",
"assets/assets/fonts/CircularStd-MediumItalic.eot": "784a62a14a25a23af8a4a40da00fcac8",
"assets/assets/fonts/CircularStd-MediumItalic.ttf": "f31aaf0e391a823478778d7b63233f09",
"assets/assets/fonts/CircularStd-MediumItalic.woff": "eddb70218f38749eaeeed7fba894fda8",
"assets/assets/fonts/CircularStd-MediumItalic.woff2": "6da584bdd8de6496ee54c90ea06aaeaf",
"assets/assets/images/hero_image.png": "ea7c21693f702ec7e535a90096840255",
"assets/assets/images/logo.png": "2f75bc52bd847267a66b013c22837196",
"assets/FontManifest.json": "8cef974715a2f07050700f7ed570457b",
"assets/fonts/MaterialIcons-Regular.otf": "8584a7fd6bafb2fc62acf6f848e8ff22",
"assets/NOTICES": "7f673730900047942f728fe9f06d3f75",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "b33218db66ef80facd531d9c75101a2b",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "a1a303a950bbc639a07d41a4c1c40762",
"/": "a1a303a950bbc639a07d41a4c1c40762",
"main.dart.js": "1153721ce83a388e71c8ab95c0b4dca9",
"manifest.json": "d1d6af4427b281252a5796e0973d257b",
"version.json": "c128ec76b21613d9ff29679dea827177"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

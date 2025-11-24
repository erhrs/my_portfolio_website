'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "4870f2b2027f1a7ccacbb1beb0451193",
"version.json": "3fe4fd5df2020acccdd334a29a3cc4f4",
"index.html": "7a4e5588243f98e07ea3645bf5e0553b",
"/": "7a4e5588243f98e07ea3645bf5e0553b",
"main.dart.js": "e83302239424b65d2272ea7e1f8dc7d6",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "cf45190907d344e52142f1d5a28e5da7",
"assets/AssetManifest.json": "ae799e6751fc9ad719e510b5fc4eace3",
"assets/NOTICES": "a15f672c4c533bb90464e73ebbbf8a73",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "7464a4712763b8853b019e6bf75f2e1b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "06d9b04c25bf43e34b26da926fedabbf",
"assets/fonts/MaterialIcons-Regular.otf": "296c4ec6a863eb9da77f3720153cf306",
"assets/assets/images/marketplace%2520(2).png": "71d4097f52ce7effa1dd0fea89993cd6",
"assets/assets/images/aviator%2520(4).png": "c049dc9ef4c491b3c72a87ed6a163bef",
"assets/assets/images/plinko%2520(4).png": "25438ad472b4ad85bd60feb737f979e2",
"assets/assets/images/hostel_management%2520(3).png": "db04b186522984a27771c398e84ce146",
"assets/assets/images/petmanagement%2520(1).png": "5ea8a961081574c6c6b1cc2aa0e26cf1",
"assets/assets/images/hostel_management%2520(2).png": "d3e357769e7e59635611487be3721115",
"assets/assets/images/profile_without_bg.png": "7921dbe984a49d12cab6e05ff3af3207",
"assets/assets/images/plinko%2520(5).png": "10daafeee565d27e5abbe4cdbf73300a",
"assets/assets/images/aviator%2520(5).png": "ec4c524fef92c5ff8c50ec872bf2fbf6",
"assets/assets/images/marketplace%2520(3).png": "a382a28e72458a7a0e21ec73fbec4795",
"assets/assets/images/cricscore%2520(1).png": "96927d1d835b32fc625ec0ffd10df389",
"assets/assets/images/aviator%2520(2).png": "e31bcbf132f391911999bfbaf5f96b27",
"assets/assets/images/plinko%2520(2).png": "93daf819332224403fd81ad850fa9743",
"assets/assets/images/tms4.png": "2c527068cb939d469f8d39b66df1a39c",
"assets/assets/images/hrm3.png": "710c4bc30dc7be3907824c05e3b78862",
"assets/assets/images/hrm2.png": "e178ffbbc3ee23b9bcd74eaaae0424df",
"assets/assets/images/hostel_management%2520(5).png": "38d58b4f8475184fe0662e18a99a2e88",
"assets/assets/images/marketplace%2520(8).png": "b3e179b5417dd8558e22a43c995d2bf7",
"assets/assets/images/petmanagement%2520(6).png": "e82a2b502d10d30571c89156aab84675",
"assets/assets/images/cricscore%2520(6).png": "cca73d5d449c31bbb4a1360a96e5f778",
"assets/assets/images/hrm1.png": "f6a3c4f3c97400a928a457da5d114473",
"assets/assets/images/marketplace%2520(4).png": "660c89df337f4b7e7c330877bb76052c",
"assets/assets/images/tms2.png": "e2489c572dd0ec0b30f806067b72dedf",
"assets/assets/images/hrm5.png": "974aeeaa0ba293430dc337f2fc0b9a80",
"assets/assets/images/marketplace%2520(5).png": "e97bf60fdb682a7beae688595a290336",
"assets/assets/images/hrm4.png": "e7033109c54d73a1136dad7acaba287a",
"assets/assets/images/cricscore%2520(7).png": "24f54269a9b367e721cf4632b6a4be68",
"assets/assets/images/tms3.png": "114197167f696e9960a510a34c9410eb",
"assets/assets/images/tms1.png": "1e942fbe7564ff67aedb373d8f46d6b8",
"assets/assets/images/petmanagement%2520(7).png": "21a7892e77199d242c24bbc9efe000de",
"assets/assets/images/hostel_management%2520(4).png": "9adfc64e49f22ceaa30105e4a3189f03",
"assets/assets/images/plinko%2520(3).png": "6e3e85f8d0411aa45c10d783cafbc8a5",
"assets/assets/images/aviator%2520(3).png": "efe7bef67aca8f143c495d6f5f481299",
"assets/assets/images/petmanagement%2520(4).png": "743495c8a09e7cfd3eaca6191efaaf8e",
"assets/assets/images/trimurti6.png": "c593bdae4aa2a345ee717b15f1be7c97",
"assets/assets/images/sanatan_app5.png": "d977cb044c4bb3cf4d94df97b3bcc319",
"assets/assets/images/sanatan_app4.png": "94f83ed9660c8297022be51f3ada9051",
"assets/assets/images/trimurti7.png": "3d6dc8300f32e7fe0e29e7b816f06235",
"assets/assets/images/trimurti5.png": "6277a45e52e99a0c6237cff9affbf35d",
"assets/assets/images/marketplace%2520(6).png": "229098d0807d0d8d56133361aa2d321c",
"assets/assets/images/sanatan_app6.png": "19ec44820507c8325678c5dcabdba184",
"assets/assets/images/cricscore%2520(4).png": "1335e1cf956db59a46cb8a643d81cdf1",
"assets/assets/images/trimurti4.png": "ba5b800bfa72ab562017e64a6990fb0a",
"assets/assets/images/cricscore%2520(5).png": "d70607db56663cc8a64112cc114a57fd",
"assets/assets/images/sanatan_app3.png": "6f75d29ec9cda130f23f7c4001871411",
"assets/assets/images/marketplace%2520(7).png": "d4caaf095fd9c93d00a7a7e5d617489d",
"assets/assets/images/sanatan_app2.png": "06cd1908fcd3be271d2dea18775e60ac",
"assets/assets/images/trimurti1.png": "d639239d86f3fe6c72c97e2b987c2adb",
"assets/assets/images/aviator%2520(1).png": "d7c3a922c1d56a36fabb9b7ecbd35fed",
"assets/assets/images/plinko%2520(1).png": "05cc145ee9b80616f60cc8a195da3cdc",
"assets/assets/images/trimurti3.png": "3644b4f8dc08c722c7137a0e5aef418c",
"assets/assets/images/profile_bg.png": "1a8f7331cf9543d2d9ff69189948fd5e",
"assets/assets/images/sanatan_app1.png": "7b9fb68d9529ac7fa279eaf86fd2e61a",
"assets/assets/images/petmanagement%2520(5).png": "b4e70f1b2d66818b9899202c61f105b3",
"assets/assets/images/trimurti2.png": "e2532f736322ecfbf16ad669bb13d0d7",
"assets/assets/images/cricscore%2520(2).png": "c45915aa0639620e6c82f5805956b149",
"assets/assets/images/petmanagement%2520(2).png": "6c2e69c5d3c514615a9658d2bcdd73d9",
"assets/assets/images/hostel_management%2520(1).png": "a118b63b50529556433ab8a3f2dad67f",
"assets/assets/images/plinko%2520(6).png": "2287ceb507e70a6d494ddc9dae1a2776",
"assets/assets/images/petmanagement%2520(3).png": "f6445ad2090959069d8584774687ac9e",
"assets/assets/images/cricscore%2520(3).png": "8ce6feda08c2506230a1fea0f70ca490",
"assets/assets/images/marketplace%2520(1).png": "bf163a63c983d2094aef52d2fad13e90",
"assets/assets/icons/flutter.png": "e02a6c427d3f2f6128219c4916cc4c6f",
"assets/assets/icons/sql.png": "1a350423b8ca9640930797207d6d457a",
"assets/assets/icons/firebase.png": "45ec5c8523c42019e2aa9fe5436750af",
"assets/assets/icons/java.png": "74e943d82452f81f6a0bb0b51ac6785d",
"assets/assets/icons/android.png": "8f6d437d59f2d47bac877d0dbe8fa818",
"assets/assets/icons/js.png": "c647884d2940f119b665a453f9c2c8f3",
"assets/assets/icons/apple.png": "a5dea8355caa48d412a800f381e61003",
"assets/assets/icons/flame.png": "5381411e9848f08e3855303a7a809c72",
"assets/assets/icons/getx.png": "601320466778953f2931de063ee741f6",
"assets/assets/icons/nodejs.png": "0451ed2e06f1103dd6481951f9ea2a1e",
"assets/assets/cv/HarshYadav.pdf": "8740637bc70ab22902786503a0922879",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b"};
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

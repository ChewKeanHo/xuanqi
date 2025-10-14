#!/bin/sh
# Copyright 2025 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2024 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2023 (Holloway) Chew, Kean Ho <hollowaykeanho@gmail.com>
# Copyright 2023 "Holloway" Chew, Kean Ho <kean.ho.chew@zoralab.com>
# Copyright 2023 ZORALab Enterprise <tech@zoralab.com>
#
#
# Licensed under (Holloway) Chew, Kean Ho's Liberal License (the 'License').
# You must comply with the license to use the content. Get the License at:
#
# https://doi.org/10.5281/zenodo.13770769
#
# You MUST ensure any interaction with the content STRICTLY COMPLIES with
# the permissions and limitations set forth in the license.




# Specifications:
#   * https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerRegistration
#   * https://developer.mozilla.org/en-US/docs/Web/API/Push_API
# Parameters:
#       ____path_dest
#               - REQUIRED
#               - destination filepath to write into.
#       ____id
#               - REQUIRED
#               - the cache value id.
#       ____caching_urls
#               - OPTIONAL
#               - all the url for caching. This is a multiline value where
#                 each line is a new entry. Each entry **MUST** comply to the
#                 following format:
#                       '[POLICY], [URL]'
#                 where:
#                       ', '      = the delimiter separator.
#                       [POLICY]  = caching policy. Only the following are
#                                   allowed:
#                                       * 'cache-first'
#                                       * 'cache-only'
#                                       * 'network-first'
#                                       * 'network-only'
#                       [URL]     = the associated URL. CORS is still enforced.
#                                   Recommend using site URL whenever possible
#                                   in absolute URL format.
#       ____push_notifications_language
#               - REQUIRED
#               - the default BCP 47 language tag (e.g. 'en' | 'zh-Hans').
#       ____push_notifications_title
#               - REQUIRED
#               - the default notice title in the specified language.
#       ____push_notifications_body
#               - REQUIRED
#               - the default notice body in the specified language.
#       ____push_notifications_icon_url
#               - OPTIONAL
#               - the default notice icon url.
#       ____push_notifications_badge_url
#               - OPTIONAL
#               - the default notice badge url when the display has insufficent
#                 screen space.
#       ____push_notifications_image_url
#               - OPTIONAL
#               - the default image content url.
#               - optional (leave it empty).
#       ____push_notifications_script_data
#               - OPTIONAL
#               - the default data payload in web script format.
#       ____push_notifications_json_actions_list
#               - OPTIONAL
#               - the list of actionable buttons for user to interact. This is
#                 a multi-lines value where each line is a new entry. Each entry
#                 **MUST** comply to the following format:
#                               '[ACTION] |,| [TITLE] |,| [ICON_URL]'
#                 where:
#                       ' |,| '   = is the delimiter separator.
#                       [ACTION]  = the user's action identifier string for
#                                   internal operations.
#                       [TITLE]   = the button label in string.
#                       [ICON]    = the icon url in string.
#       ____push_notifications_tag
#               - OPTIONAL
#               - the notice category (e.g. 'general').
#       ____push_notifications_interaction
#               - OPTIONAL
#               - the user dismissal requirement. The default is 'default'
#                 as this is the user expected experience. Only accepts the
#                 following values:
#                       * 'true'    - requires user to dismiss manually
#                       * 'false'   - optionally removed by device.
#                       * 'default' - use device's default settings.
#       ____push_notifications_slient_mode
#               - OPTIONAL
#               - the notification action to be in silent mode. When set to
#                 'true', '____push_notifications_vibration' will be ignored.
#                 The default is 'null'. Only accepts the following values:
#                       * 'true'    - operate in silent mode.
#                       * 'false'   - not operate in silent mode.
#                       * 'null'    - the device default settings.
#       ____push_notifications_vibration
#               - OPTIONAL
#               - the vibration pattern. This is a multiline value where each
#                 line is an entry. Each entry is a positive number
#                 milliseconds.
#               - raise error if any entry is less than 0.
#       ____push_notifications_log_analytics_function_body
#               - OPTIONAL
#               - web script function content for handling push notification
#                 closure. This is designed for post handling purposes like
#                 marketing analytics hook. It provides a single parameter
#                 named 'event' which is a result from 'notificationclose'
#                 event listener.
# Returns:
#       Return Code
#               - '0' means ok; error otherwise.
views_pwa_write_service_worker() {
        #____path_dest="$1"
        #____id="$2"
        #____caching_urls="$3"
        #____push_notifications_language="$4"
        #____push_notifications_title="$5"
        #____push_notifications_body="$6"
        #____push_notifications_icon_url="$7"
        #____push_notifications_badge_url="$8"
        #____push_notifications_image_url="$9"
        #____push_notifications_script_data="${10}"
        #____push_notifications_json_actions_list="${11}"
        #____push_notifications_tag="${12}"
        #____push_notifications_interaction="${13}"
        #____push_notifications_slient_mode="${14}"
        #____push_notifications_vibration="${15}"
        #____push_notifications_log_analytics_function_body="${16}"


        # validate input
        if [ "$2" = "" ]; then
                return 1
        fi

        if [ "$4" = "" ]; then
                return 1
        fi

        if [ "$5" = "" ]; then
                return 1
        fi

        if [ "$6" = "" ]; then
                return 1
        fi


        # execute
        ## process actions list
        ____actions=""
        if [ ! "${11}" = "" ]; then
                ## process list content
                ____is_first=true
                ____old_IFS="$IFS"
                while IFS= read -r ____line || [ -n "$____line" ]; do
                        if [ "$____line" = "" ]; then
                                continue
                        fi

                        ## make sure to comply with json comma listing format
                        if [ "$____is_first" = "true" ]; then
                                ____actions="${____actions}{
"
                        else
                                ____actions="${____actions}, {
"
                        fi
                        ____is_first=false

                        ## extract values
                        ____action="${____line%%" |,| "*}"
                        ____line="${____line#*" |,| "}"

                        ____title="${____line%%" |,| "*}"
                        ____line="${____line#*" |,| "}"

                        ## print content without newline for json listing
                        ## specification
                        ____actions="${____actions}\
        \"action\": \"${____action}\",
        \"title\": \"${____title}\",
        \"icon\": \"${____line}\"
}"
                done<<EOF
${13}
EOF
                IFS="$____old_IFS"
                unset ____line ____old_IFS ____is_first
        fi

        # write push notification language policy
        case "${13}" in
        1|true|True|TRUE)
                ____interaction=true
                ;;
        *)
                ____interaction=false
                ;;
        esac

        case "${14}" in
        1|true|True|TRUE)
                ____slient=true
                ;;
        0|false|False|FALSE)
                ____slient=false
                ;;
        *)
                ____slient=null
                ;;
        esac

        ____vibration="100, 50, 100"
        if [ ! "${15}" = "" ]; then
                ____vibration=""
                ____is_first=true
                ____old_IFS=""
                while IFS="" read -r ____line || [ -n "$____line" ]; do
                        if [ "$____line" = "" ]; then
                                continue
                        fi

                        if [ ! "$____is_first" = "true" ]; then
                                ____vibration="${____vibration}, "
                        fi

                        case "$____line" in
                        "")
                                continue
                                ;;
                        *[!0-9]*)
                                IFS="$____old_IFS"
                                unset ____line \
                                        ____old_IFS \
                                        ____vibration \
                                        ____silent \
                                        ____interaction \
                                        ____actions
                                return 1
                                ;;
                        *)
                                if [ "$____line" -lt 0 ]; then
                                        IFS="$____old_IFS"
                                        unset ____line \
                                                ____old_IFS \
                                                ____vibration \
                                                ____silent \
                                                ____interaction \
                                                ____actions
                                        return 1
                                fi

                                ____vibration="${____vibration}${____line}"
                                ;;
                        esac
                done<<EOF
${15}
EOF
                IFS="$____old_IFS"
                unset ____line \
                        ____old_IFS \
                        ____vibration \
                        ____silent \
                        ____interaction \
                        ____actions
        fi

        printf -- "%s" "\
// PWA push notification definitions
const PUSH_NOTICE_LANG_DEFAULT = '${4}';
const PUSH_NOTICE_TITLE_DEFAULT = '${5}';
const PUSH_NOTICE_BODY_DEFAULT = '${6}';
const PUSH_NOTICE_ICON_DEFAULT = '${7}';
const PUSH_NOTICE_BADGE_DEFAULT = '${8}';
const PUSH_NOTICE_IMAGE_DEFAULT = '${9}';
const PUSH_NOTICE_DATA_DEFAULT = ${10:-'null'};
const PUSH_NOTICE_ACTIONS_DEFAULT = [${____actions}];
const PUSH_NOTICE_TAG_DEFAULT = '${12}';
const PUSH_NOTICE_INTERACTION_DEFAULT = ${____interaction};
const PUSH_NOTICE_SILENT_DEFAULT = ${____silent};
const PUSH_NOTICE_VIBRATE_DEFAULT = [${____vibration}];

function log_push_notification_closure(event) {
${16:-"return;"}
}
" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                unset ____vibration ____silent ____interaction
                return 1
        fi


        # write caching policies
        printf -- "%s" "\
// PWA caching definitions
const POLICY_CACHE_FIRST = 'cache-first';
const POLICY_CACHE_ONLY = 'cache-only';
const POLICY_NETWORK_FIRST = 'network-first';
const POLICY_NETWORK_ONLY = 'network-only';

// PWA caching policies
let OFFLINE_CACHE = '${2}';
let OFFLINE_RESOURCES = {
" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # register each caching url
        if [ ! "$3" = "" ]; then
                ____is_first=true
                ____old_IFS="$IFS"
                while IFS="" read -r ____line || [ -n "$____line" ]; do
                        if [ "$____line" = "" ]; then
                                continue
                        fi

                        case "${____line%%", "*}" in
                        "cache-first")
                                ____policy="cache-first"
                                ;;
                        "cache-only")
                                ____policy="cache-only"
                                ;;
                        "network-only")
                                ____policy="network-only"
                                ;;
                        *)
                                ____policy="network-first"
                                ;;
                        esac

                        if [ ! "$____is_first" = " true" ]; then
                                printf -- "%s" ",
" >> "${1}.tmp"
                                if [ $? -ne 0 ]; then
                                        return 1
                                fi
                        fi
                        ____is_first=false

                        printf -- "%s" "\
	{ \"${____line##", "}\" = \"${____policy}\" }" >> "${1}.tmp"
                        if [ $? -ne 0 ]; then
                                IFS="$____old_IFS"
                                unset ____policy \
                                        ____line \
                                        ____old_IFS \
                                        ____is_first
                                return 1
                        fi

                done <<EOF
${3}
EOF
                IFS="$____old_IFS"
                unset ____policy \
                        ____line \
                        ____old_IFS \
                        ____is_first

                ## close offline resources
                printf -- "%s" "\
};
" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        return 1
                fi
        else
                printf -- "%s" "};
" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        return 1
                fi
        fi


        # write pwa functionalities
        printf -- "%s" "\
// PWA Caching Mechanisms
const __putInCache = async (request, response) => {
	const cache = await caches.open(OFFLINE_CACHE);
	await cache.put(request, response);
}

const _fetchNetworkOnly = async (request) => {
	try {
		const networkResponse = await fetch(request);
		__putInCache(request, networkResponse.clone());
		return networkResponse;
	} catch {
		return new Response(\"Network Error\", {
			status: 408,
			headers: { \"Content-Type\": \"text-plain\" },
		});
	}
}

const _fetchCacheOnly = async (request) => {
	const cachedResponse = await caches.match(request);
	if (cachedResponse) {
		return cachedResponse;
	}

	return new Response(\"Asset Not Found\", {
		status: 404,
		headers: { \"Content-Type\": \"text-plain\" },
	});
}

const _fetchNetworkFirst = async (request) => {
	try {
		// source from network
		const networkResponse = await fetch(request);
		__putInCache(request, networkResponse.clone());
		return networkResponse;
	} catch {
		// source from cache
		const cachedResponse = await caches.match(request);
		if (cachedResponse) {
			return cachedResponse;
		}
	}

	// both failed - return with error response
	return new Response(\"Network Error\", {
		status: 408,
		headers: { \"Content-Type\": \"text-plain\" },
	});
}


const _fetchCacheFirst = async (request) => {
	// source from cache
	const cachedResponse = await caches.match(request);
	if (cachedResponse) {
		return cachedResponse;
	}

	try {
		// fallback to network
		const networkResponse = await fetch(request);
		__putInCache(request, networkResponse.clone());
		return networkResponse;
	} catch {
		// both failed -return with error response
		return new Response(\"Network Error\", {
			status: 408,
			headers: { \"Content-Type\": \"text-plain\" },
		});
	}
}


self.addEventListener(\"fetch\", event => {
	if((event.request.url.indexOf('http') === 0)) {
		switch (OFFLINE_RESOURCES[event.request.url]) {
		case POLICY_CACHE_FIRST:
			event.respondWith(_fetchCacheFirst(event.request));
			break;
		case POLICY_CACHE_ONLY:
			event.respondWith(_fetchCacheOnly(event.request));
			break;
		case POLICY_NETWORK_ONLY:
			event.respondWith(_fetchNetworkOnly(event.request));
			break;
		default: // POLICY_NETWORK_FIRST
			event.respondWith(_fetchNetworkFirst(event.request));
			break;
		}
	}
});




// PWA install mechanism
self.addEventListener(\"install\", event => {
	event.waitUntil((async () => {
		var resources = [];

		for(let key in OFFLINE_RESOURCES) {
			resources.push(key);
		}

		const cache = await caches.open(OFFLINE_CACHE);
		return cache.addAll(resources);
	})());
});




// PWA activate mechanism
self.addEventListener(\"activate\", event => {
	event.waitUntil(
	caches.keys().then(keyList => {
		return Promise.all(
		keyList.map(key => {
			if (key === OFFLINE_CACHE) {
				return;
			}

			return caches.delete(key);
		}));
	}));
});




// handle push notification
self.addEventListener('push', event => {
	let title = PUSH_NOTICE_TITLE_DEFAULT;
	let options = {
		actions: PUSH_NOTICE_ACTIONS_DEFAULT,
		badge: PUSH_NOTICE_BADGE_DEFAULT,
		body: PUSH_NOTICE_BODY_DEFAULT,
		data: PUSH_NOTICE_DATA_DEFAULT,
		icon: PUSH_NOTICE_ICON_DEFAULT,
		image: PUSH_NOTICE_IMAGE_DEFAULT,
		lang: PUSH_NOTICE_LANG_DEFAULT,
		requireInteraction: PUSH_NOTICE_INTERACTION_DEFAULT,
		silent: PUSH_NOTICE_SILENT_DEFAULT,
		tag: PUSH_NOTICE_TAG_DEFAULT,
		vibrate: null
	};

	try {
		let incoming = null;
		if (event.data) {
			incoming = event.data.json();
		}

		if (incoming.title &&  incoming.title != \"\") {
			title = incoming.title;
		}

		if (incoming.actions) {
			options.actions = incoming.actions;
		}

		if (incoming.badge && incoming.badge != \"\") {
			options.badge = incoming.badge;
		}

		if (incoming.data) {
			options.data = incoming.data;
		}

		if (incoming.body && incoming.body != \"\") {
			options.body = incoming.body;
		}

		if (incoming.icon && incoming.icon != \"\") {
			options.icon = incoming.icon;
		}

		if (incoming.image && incoming.image != \"\") {
			options.image = incoming.image;
		}

		if (incoming.lang && incoming.lang != \"\") {
			options.lang = incoming.lang;
		}

		if (
			incoming.requireInteraction &&
			incoming.requireInteraction === 'boolean'
		) {
			options.requireInteraction = incoming.requireInteraction;
		}

		if (
			incoming.silent == null ||
			incoming.silent == true ||
			incoming.silent == false
		) {
			options.silent = incoming.silent;
		}

		if (incoming.tag && incoming.tag != \"\") {
			options.tag = incoming.tag;
		}

		if (
			options.silent != true &&
			incoming.vibrate
		) {
			options.vibrate = incoming.vibrate;
		}
	} catch (error) {}

	event.waitUntil(self.registration.showNotification(title, options));
});

// push notification click handling
self.addEventListener('notificationclick', event => {
	event.notification.close();

	const notificationData = event.notification.data;
	const targetUrl = notificationData.url || '/';

	event.waitUntil(
	clients.matchAll({
		type: 'window',
		includeUncontrolled: true
	}).then(windowClients => {
		// switch to existing window
		for (let client of windowClients) {
			if (client.url === targetUrl && 'focus' in client) {
				return client.focus();
			}
		}

		// open new window if existing is unavailable
		if (clients.openWindow) {
			return clients.openWindow(targetUrl);
		}
	}));
});

// push notification close handling
self.addEventListener('notificationclose', event => {
	log_push_notification_closure(event);
});
" >> "${1}.tmp"
        if [ $? -ne 0 ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0

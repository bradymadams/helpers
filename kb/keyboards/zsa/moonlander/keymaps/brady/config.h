#define USB_SUSPEND_WAKEUP_DELAY 0
#define SERIAL_NUMBER "EY576/x9679p"
#define LAYER_STATE_8BIT
#define COMBO_COUNT 5

#define RGB_MATRIX_STARTUP_SPD 60

/*
 * Above are left as is from Oryx. Below are my changes.
 */

// https://docs.qmk.fm/tap_hold#tapping-term
#define TAPPING_TERM 175 // Changed from default of 200

// https://docs.qmk.fm/tap_hold#hold-on-other-key-press
#define HOLD_ON_OTHER_KEY_PRESS

// https://docs.qmk.fm/features/leader_key#basic-configuration
#define LEADER_PER_KEY_TIMING
#define LEADER_TIMEOUT 250

#define EXTRAS

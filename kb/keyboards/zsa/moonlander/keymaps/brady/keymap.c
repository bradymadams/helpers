#include "defaults.h"
#include "keycodes.h"
#include "quantum.h"
#include QMK_KEYBOARD_H
#include "version.h"
#define MOON_LED_LEVEL LED_LEVEL
#ifndef ZSA_SAFE_RANGE
#define ZSA_SAFE_RANGE SAFE_RANGE
#endif

enum custom_keycodes {
  RGB_SLD = ZSA_SAFE_RANGE,
  ARROW,
  VIM_SAVE,
  VIM_SAVE_ALL,
  UP_DIR,
  MATCHING_BRACKETS_PAREN,
  MATCHING_BRACKETS_CURLY,
  MATCHING_BRACKETS_SQUAR,
  MATCHING_BRACKETS_ANGLE,
};

enum tap_dance_codes { TD_CTRL_CTRL_SHIFT };

// clang-format off

  /*
   * LAYER TEMPLATE
   *
  [i] = LAYOUT_moonlander(
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,         // ROW 1 - LEFT
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,         // ROW 1 - RIGHT
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,         // ROW 2 - LEFT
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,         // ROW 2 - RIGHT
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,         // ROW 3 - LEFT
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,         // ROW 3 - RIGHT
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,                         // ROW 4 - LEFT
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,                         // ROW 4 - RIGHT
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,                         // ROW 5 - LEFT + RED THUMB KEY (LAST)
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,                         // ROW 5 - RIGHT + RED THUMB KEY (1)
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,                                                                         // ROW 6 - LEFT (THUMB KEYS)
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT                                                                          // ROW 6 - RIGHT (THUMB KEYS)
  ),
   */

/*
 * Tips and hints
 *  MT(MOD, KC)     MOD when held, otherwise K
 *  MO(I)           Layer toggle to I while held
 *  LT(I, KC)       Layer toggle to I while held, otherwhise KC
 *  OSL(I)          Switch to layer I for one keypress (one shot layer)
 *  TD(DANCE)       Tap dance: https://docs.qmk.fm/features/tap_dance
 */

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  /*
   * LAYER 0 (DEFAULT)
   */
  [0] = LAYOUT_moonlander(
    OSL(1),         KC_1,           KC_2,    LT(3, KC_3),           KC_4,           KC_5,     KC_HOME,                      // ROW 1 - LEFT
    VIM_SAVE,       KC_6,           KC_7,           KC_8,           KC_9,           KC_0,     KC_TRANSPARENT,               // ROW 1 - RIGHT
    LT(2, KC_EQUAL),KC_Q,           KC_W,           KC_E,           KC_R,           KC_T,     KC_END,                       // ROW 2 - LEFT
    KC_TRANSPARENT, KC_Y,           KC_U,           KC_I,           KC_O,           KC_P,     KC_BSLS,                      // ROW 2 - RIGHT
    LT(1, KC_MINUS),KC_A,           KC_S,           KC_D,           KC_F,           KC_G,     KC_TRANSPARENT,               // ROW 3 - LEFT
    ARROW,          KC_H,           KC_J,           KC_K,           KC_L,           KC_SCLN,  KC_QUOTE,                     // ROW 3 - RIGHT
    KC_GRAVE,       KC_Z,           KC_X,           KC_C,           KC_V,           KC_B,                                   // ROW 4 - LEFT
    KC_N,           KC_M,           KC_COMMA,       KC_DOT,         KC_SLASH,       KC_TAB,                                 // ROW 4 - RIGHT
    TD(TD_CTRL_CTRL_SHIFT), KC_TRANSPARENT, KC_TRANSPARENT, KC_LEFT, KC_RIGHT,      KC_TRANSPARENT,                         // ROW 5 - LEFT + RED THUMB KEY (LAST)
    QK_LEAD,        KC_UP,          KC_DOWN,        KC_LBRC,        KC_RBRC,        KC_TRANSPARENT,                         // ROW 5 - RIGHT + RED THUMB KEY (1)
    MT(MOD_LSFT, KC_BSPC),MT(MOD_LALT, KC_ESCAPE),MT(MOD_LGUI, KC_DEL),                                                     // ROW 6 - LEFT (THUMB KEYS)
    KC_ENTER,       MT(MOD_LCTL, KC_TAB),           KC_SPACE                                                                // ROW 6 - RIGHT (THUMB KEYS)
  ),
  /*
   * LAYER 1
   */
  [1] = LAYOUT_moonlander(
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,         // ROW 1 - LEFT
    VIM_SAVE_ALL,   KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_LPRN,        KC_RPRN,        KC_TRANSPARENT,         // ROW 1 - RIGHT
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,         // ROW 2 - LEFT
    KC_TRANSPARENT, KC_TRANSPARENT, KC_LBRC,        KC_RBRC,        KC_LABK,        KC_RABK,        KC_TRANSPARENT,         // ROW 2 - RIGHT
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,         // ROW 3 - LEFT
    UP_DIR,         KC_TRANSPARENT, KC_LPRN,        KC_RPRN,        KC_LCBR,        KC_RCBR,        KC_TRANSPARENT,         // ROW 3 - RIGHT
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,                         // ROW 4 - LEFT
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,                         // ROW 4 - RIGHT
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,                         // ROW 5 - LEFT + RED THUMB KEY (LAST)
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,                         // ROW 5 - RIGHT + RED THUMB KEY (1)
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,                                                                         // ROW 6 - LEFT (THUMB KEYS)
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT                                                                          // ROW 6 - RIGHT (THUMB KEYS)
  ),
  /*
   * LAYER 2
   */
  [2] = LAYOUT_moonlander(
    KC_ESCAPE,      KC_F1,          KC_F2,          KC_F3,          KC_F4,          KC_F5,          KC_TRANSPARENT,         // ROW 1 - LEFT
    KC_TRANSPARENT, KC_F6,          KC_F7,          KC_F8,          KC_F9,          KC_F10,         KC_F11,                 // ROW 1 - RIGHT
    KC_TRANSPARENT, KC_EXLM,        KC_AT,          KC_LPRN,        KC_RPRN,        KC_PIPE,        KC_TRANSPARENT,         // ROW 2 - LEFT
    KC_TRANSPARENT, KC_BSPC,        KC_7,           KC_8,           KC_9,           KC_KP_PLUS,     KC_F12,                 // ROW 2 - RIGHT
    KC_TRANSPARENT, KC_HASH,        KC_DLR,         KC_LBRC,        KC_RBRC,        KC_GRAVE,       KC_TRANSPARENT,         // ROW 3 - LEFT
    KC_TRANSPARENT, KC_E,           KC_4,           KC_5,           KC_6,           KC_MINUS,       KC_TRANSPARENT,         // ROW 3 - RIGHT
    KC_TRANSPARENT, KC_PERC,        KC_CIRC,        KC_LCBR,        KC_RCBR,        KC_TILD,                                // ROW 4 - LEFT
    KC_SCLN,        KC_1,           KC_2,           KC_3,           KC_BSLS,        KC_TRANSPARENT,                         // ROW 4 - RIGHT
    KC_TRANSPARENT, KC_COMMA,       KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,                         // ROW 5 - LEFT + RED THUMB KEY (LAST)
    KC_TRANSPARENT, KC_0,           KC_DOT,         KC_NO,          KC_EQUAL,       KC_TRANSPARENT,                         // ROW 5 - RIGHT + RED THUMB KEY (1)
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,                                                                         // ROW 6 - LEFT (THUMB KEYS)
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT                                                                          // ROW 6 - RIGHT (THUMB KEYS)
  ),
  /*
   * LAYER 3 (RGB CONTROL ON LEFT KB, AUDIO & MOUSE CONTROL ON RIGHT KB)
   */
  [3] = LAYOUT_moonlander(
    UG_VALU, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, UG_HUEU,                       // ROW 1 - LEFT
    KC_MEDIA_NEXT_TRACK, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, AU_TOGG,           // ROW 1 - RIGHT
    UG_VALD, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, UG_HUED,                       // ROW 2 - LEFT
    KC_MEDIA_PREV_TRACK, KC_TRANSPARENT, KC_MS_BTN1, KC_MS_UP, KC_MS_BTN2, KC_TRANSPARENT, MU_TOGG,                         // ROW 2 - RIGHT
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,         // ROW 3 - LEFT
    KC_TRANSPARENT, KC_TRANSPARENT, KC_MS_LEFT, KC_MS_DOWN, KC_MS_RIGHT, KC_TRANSPARENT, MU_NEXT,                           // ROW 3 - RIGHT
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,                         // ROW 4 - LEFT
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,                         // ROW 4 - RIGHT
    KC_TRANSPARENT, RGB_TOG, TOGGLE_LAYER_COLOR, RGB_MODE_REVERSE, RGB_MODE_FORWARD, KC_TRANSPARENT,                        // ROW 5 - LEFT + RED THUMB KEY (LAST)
    KC_TRANSPARENT, KC_AUDIO_VOL_UP, KC_AUDIO_VOL_DOWN, KC_AUDIO_MUTE, KC_TRANSPARENT, KC_TRANSPARENT,                      // ROW 5 - RIGHT + RED THUMB KEY (1)
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT,                                                                         // ROW 6 - LEFT (THUMB KEYS)
    KC_TRANSPARENT, KC_TRANSPARENT, KC_TRANSPARENT                                                                          // ROW 6 - RIGHT (THUMB KEYS)
  ),
};
// clang-format on

const uint16_t PROGMEM combo_escape[] = {KC_J, KC_K, COMBO_END};
const uint16_t PROGMEM combo_matching_brackets_paren[] = {KC_LPRN, KC_RPRN,
                                                          COMBO_END};
const uint16_t PROGMEM combo_matching_brackets_curly[] = {KC_LCBR, KC_RCBR,
                                                          COMBO_END};
const uint16_t PROGMEM combo_matching_brackets_squar[] = {KC_LBRC, KC_RBRC,
                                                          COMBO_END};
const uint16_t PROGMEM combo_matching_brackets_angle[] = {KC_LABK, KC_RABK,
                                                          COMBO_END};

combo_t key_combos[COMBO_COUNT] = {
    COMBO(combo_escape, KC_ESCAPE),
    COMBO(combo_matching_brackets_paren, MATCHING_BRACKETS_PAREN),
    COMBO(combo_matching_brackets_curly, MATCHING_BRACKETS_CURLY),
    COMBO(combo_matching_brackets_squar, MATCHING_BRACKETS_SQUAR),
    COMBO(combo_matching_brackets_angle, MATCHING_BRACKETS_ANGLE),
};

extern rgb_config_t rgb_matrix_config;

RGB hsv_to_rgb_with_value(HSV hsv) {
  RGB rgb = hsv_to_rgb(hsv);
  float f = (float)rgb_matrix_config.hsv.v / UINT8_MAX;
  return (RGB){f * rgb.r, f * rgb.g, f * rgb.b};
}

void keyboard_post_init_user(void) { rgb_matrix_enable(); }

// clang-format off
    /*
     * LAYER LED COLOR TEMPLATE
     *
    [i] = {
        LED_RED__, LED_RED__, LED_RED__, LED_RED__, LED_RED__,  // COL 1
        LED_RED__, LED_RED__, LED_RED__, LED_RED__, LED_RED__,  // COL 2
        LED_RED__, LED_RED__, LED_RED__, LED_RED__, LED_RED__,  // COL 3
        LED_RED__, LED_RED__, LED_RED__, LED_RED__, LED_RED__,  // COL 4
        LED_RED__, LED_RED__, LED_RED__, LED_RED__, LED_RED__,  // COL 5
        LED_RED__, LED_RED__, LED_RED__, LED_RED__,             // COL 6
        LED_RED__, LED_RED__, LED_RED__,                        // COL 7
        LED_RED__, LED_RED__, LED_RED__, LED_RED__,             // COL 8 (LEFT THUMB KEYS)
                                                                // SPLIT
        LED_RED__, LED_RED__, LED_RED__, LED_RED__, LED_RED__,  // COL 16
        LED_RED__, LED_RED__, LED_RED__, LED_RED__, LED_RED__,  // COL 15
        LED_RED__, LED_RED__, LED_RED__, LED_RED__, LED_RED__,  // COL 14
        LED_RED__, LED_RED__, LED_RED__, LED_RED__, LED_RED__,  // COL 13
        LED_RED__, LED_RED__, LED_RED__, LED_RED__, LED_RED__,  // COL 12
        LED_RED__, LED_RED__, LED_RED__, LED_RED__,             // COL 11
        LED_RED__, LED_RED__, LED_RED__,                        // COL 10
        LED_RED__, LED_RED__, LED_RED__, LED_RED__              // COL 9 (RIGHT THUMB KEYS)
    },
    */

// Colors are in HSV
#define LED_NONE_ {0, 255, 0} // Use to skip setting the LED, will inherit the default color. 
#define LED_OFF__ {0, 0, 0}
#define LED_WHITE {0, 0, 255}
#define LED_RED__ {0, 255, 255}
#define LED_YELOW {43, 255, 255}
#define LED_GREEN {85, 255, 255}
#define LED_CYAN_ {128, 255, 255}
#define LED_BLUE_ {170, 255, 255}
#define LED_MGNTA {213, 255, 255}

const uint8_t PROGMEM ledmap[][RGB_MATRIX_LED_COUNT][3] = {
    [1] = {
        LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__,  // COL 1
        LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__,  // COL 2
        LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__,  // COL 3
        LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__,  // COL 4
        LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__,  // COL 5
        LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__,             // COL 6
        LED_OFF__, LED_OFF__, LED_OFF__,                        // COL 7
        LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__,             // COL 8 (LEFT THUMB KEYS)
                                                                // SPLIT
        LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__,  // COL 16
        LED_OFF__, LED_BLUE_, LED_BLUE_, LED_OFF__, LED_OFF__,  // COL 15
        LED_OFF__, LED_BLUE_, LED_BLUE_, LED_OFF__, LED_OFF__,  // COL 14
        LED_OFF__, LED_BLUE_, LED_BLUE_, LED_OFF__, LED_OFF__,  // COL 13
        LED_OFF__, LED_BLUE_, LED_BLUE_, LED_OFF__, LED_OFF__,  // COL 12
        LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__,             // COL 11
        LED_OFF__, LED_OFF__, LED_OFF__,                        // COL 10
        LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__              // COL 9 (RIGHT THUMB KEYS)
    },

    [2] = {
        LED_GREEN, LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__,  // COL 1
        LED_GREEN, LED_YELOW, LED_YELOW, LED_YELOW, LED_YELOW,  // COL 2
        LED_GREEN, LED_YELOW, LED_YELOW, LED_YELOW, LED_OFF__,  // COL 3
        LED_GREEN, LED_BLUE_, LED_BLUE_, LED_BLUE_, LED_OFF__,  // COL 4
        LED_GREEN, LED_BLUE_, LED_BLUE_, LED_BLUE_, LED_OFF__,  // COL 5
        LED_GREEN, LED_YELOW, LED_YELOW, LED_YELOW,             // COL 6
        LED_OFF__, LED_OFF__, LED_OFF__,                        // COL 7
        LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__,             // COL 8 (LEFT THUMB KEYS)
                                                                // SPLIT
        LED_GREEN, LED_GREEN, LED_OFF__, LED_OFF__, LED_OFF__,  // COL 16
        LED_GREEN, LED_YELOW, LED_YELOW, LED_YELOW, LED_YELOW,  // COL 15
        LED_GREEN, LED_BLUE_, LED_BLUE_, LED_BLUE_, LED_OFF__,  // COL 14
        LED_GREEN, LED_BLUE_, LED_BLUE_, LED_BLUE_, LED_YELOW,  // COL 13
        LED_GREEN, LED_BLUE_, LED_BLUE_, LED_BLUE_, LED_BLUE_,  // COL 12
        LED_GREEN, LED_CYAN_, LED_CYAN_, LED_CYAN_,             // COL 11
        LED_RED__, LED_OFF__, LED_RED__,                        // COL 10
        LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__              // COL 9 (RIGHT THUMB KEYS)
    },

    [3] = {
        LED_WHITE, LED_WHITE, LED_OFF__, LED_OFF__, LED_OFF__,  // COL 1
        LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__, LED_WHITE,  // COL 2
        LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__, LED_WHITE,  // COL 3
        LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__, LED_WHITE,  // COL 4
        LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__, LED_WHITE,  // COL 5
        LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__,             // COL 6
        LED_WHITE, LED_WHITE, LED_OFF__,                        // COL 7
        LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__,             // COL 8 (LEFT THUMB KEYS)
                                                                // SPLIT
        LED_WHITE, LED_WHITE, LED_WHITE, LED_OFF__, LED_OFF__,  // COL 16
        LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__,  // COL 15
        LED_OFF__, LED_GREEN, LED_GREEN, LED_OFF__, LED_WHITE,  // COL 14
        LED_OFF__, LED_GREEN, LED_GREEN, LED_OFF__, LED_WHITE,  // COL 13
        LED_OFF__, LED_GREEN, LED_GREEN, LED_OFF__, LED_WHITE,  // COL 12
        LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__,             // COL 11
        LED_WHITE, LED_WHITE, LED_OFF__,                        // COL 10
        LED_OFF__, LED_OFF__, LED_OFF__, LED_OFF__              // COL 9 (RIGHT THUMB KEYS)
    },
};
// clang-format on

void set_layer_color(int layer) {
  for (int i = 0; i < RGB_MATRIX_LED_COUNT; i++) {
    HSV hsv = {
        .h = pgm_read_byte(&ledmap[layer][i][0]),
        .s = pgm_read_byte(&ledmap[layer][i][1]),
        .v = pgm_read_byte(&ledmap[layer][i][2]),
    };
    if (!hsv.h && !hsv.v) {
      if (hsv.s == 0) {
        rgb_matrix_set_color(i, 0, 0, 0);
      }
      // if saturation == 0 we don't set the color (LED_NONE_)
    } else {
      RGB rgb = hsv_to_rgb_with_value(hsv);
      rgb_matrix_set_color(i, rgb.r, rgb.g, rgb.b);
    }
  }
}

bool rgb_matrix_indicators_user(void) {
  if (rawhid_state.rgb_control) {
    return false;
  }
  if (!keyboard_config.disable_layer_led) {
    switch (biton32(layer_state)) {
    case 1:
      set_layer_color(1);
      break;
    case 2:
      set_layer_color(2);
      break;
    case 3:
      set_layer_color(3);
      break;
    default:
      if (rgb_matrix_get_flags() == LED_FLAG_NONE) {
        rgb_matrix_set_color_all(0, 0, 0);
      }
    }
  } else {
    if (rgb_matrix_get_flags() == LED_FLAG_NONE) {
      rgb_matrix_set_color_all(0, 0, 0);
    }
  }

  return true;
}

typedef struct {
  bool is_press_action;
  uint8_t step;
} tap;

enum {
  SINGLE_TAP = 1,
  SINGLE_HOLD,
  DOUBLE_TAP,
  DOUBLE_HOLD,
  DOUBLE_SINGLE_TAP,
  MORE_TAPS
};

static tap dance_state[2];

uint8_t dance_step(tap_dance_state_t *state);

uint8_t dance_step(tap_dance_state_t *state) {
  if (state->count == 1) {
    if (state->interrupted || !state->pressed)
      return SINGLE_TAP;
    else
      return SINGLE_HOLD;
  } else if (state->count == 2) {
    if (state->interrupted)
      return DOUBLE_SINGLE_TAP;
    else if (state->pressed)
      return DOUBLE_HOLD;
    else
      return DOUBLE_TAP;
  }
  return MORE_TAPS;
}

void dance_0_finished(tap_dance_state_t *state, void *user_data) {
  dance_state[0].step = dance_step(state);
  switch (dance_state[0].step) {
  case SINGLE_HOLD:
    register_code(KC_LEFT_CTRL);
    break;
  case DOUBLE_HOLD:
    register_code(KC_LEFT_CTRL);
    register_code(KC_LEFT_SHIFT);
    break;
  }
}

void dance_0_reset(tap_dance_state_t *state, void *user_data) {
  wait_ms(10);
  switch (dance_state[0].step) {
  case SINGLE_HOLD:
    unregister_code(KC_LEFT_CTRL);
    break;
  case DOUBLE_HOLD:
    unregister_code(KC_LEFT_CTRL);
    unregister_code(KC_LEFT_SHIFT);
    break;
  }
  dance_state[0].step = 0;
}

tap_dance_action_t tap_dance_actions[] = {
    [TD_CTRL_CTRL_SHIFT] =
        ACTION_TAP_DANCE_FN_ADVANCED(NULL, dance_0_finished, dance_0_reset),
};

void send_custom(uint16_t keycode) {
  keyrecord_t kr = {.event = {.pressed = true}};
  process_record_user(keycode, &kr);
  kr.event.pressed = false;
  process_record_user(keycode, &kr);
}

void leader_start_user(void) {}

void leader_end_user(void) {
#ifdef EXTRAS
#include "extras.h"
#endif
}

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
  case QK_MODS ... QK_MODS_MAX:
    // Mouse keys with modifiers work inconsistently across operating systems,
    // this makes sure that modifiers are always applied to the mouse key that
    // was pressed.
    if (IS_MOUSE_KEYCODE(QK_MODS_GET_BASIC_KEYCODE(keycode))) {
      if (record->event.pressed) {
        add_mods(QK_MODS_GET_MODS(keycode));
        send_keyboard_report();
        wait_ms(2);
        register_code(QK_MODS_GET_BASIC_KEYCODE(keycode));
        return false;
      } else {
        wait_ms(2);
        del_mods(QK_MODS_GET_MODS(keycode));
      }
    }
    break;
  case ARROW:
    if (record->event.pressed) {
      SEND_STRING("->");
    }
    break;
  case VIM_SAVE:
    if (record->event.pressed) {
      SEND_STRING(SS_TAP(X_ESCAPE) SS_DELAY(100) SS_LSFT(SS_TAP(X_SCLN))
                      SS_DELAY(100) SS_TAP(X_W) SS_DELAY(100) SS_TAP(X_ENTER));
    }
    break;
  case VIM_SAVE_ALL:
    if (record->event.pressed) {
      SEND_STRING(SS_TAP(X_ESCAPE) SS_DELAY(100) SS_LSFT(SS_TAP(X_SCLN))
                      SS_DELAY(100) SS_TAP(X_W) SS_DELAY(100) SS_TAP(X_A)
                          SS_DELAY(100) SS_TAP(X_ENTER));
    }
    break;
  case UP_DIR:
    if (record->event.pressed) {
      SEND_STRING(SS_TAP(X_DOT) SS_DELAY(50) SS_TAP(X_DOT) SS_DELAY(50)
                      SS_TAP(X_SLASH));
    }
    break;
  case MATCHING_BRACKETS_PAREN:
    if (record->event.pressed) {
      SEND_STRING(SS_LSFT(SS_TAP(X_9)) SS_LSFT(SS_TAP(X_0)) SS_TAP(X_LEFT));
    }
    break;
  case MATCHING_BRACKETS_CURLY:
    if (record->event.pressed) {
      SEND_STRING(SS_LSFT(SS_TAP(X_LEFT_BRACKET))
                      SS_LSFT(SS_TAP(X_RIGHT_BRACKET)) SS_TAP(X_LEFT));
    }
    break;
  case MATCHING_BRACKETS_SQUAR:
    if (record->event.pressed) {
      SEND_STRING(SS_TAP(X_LEFT_BRACKET) SS_TAP(X_RIGHT_BRACKET)
                      SS_TAP(X_LEFT));
    }
    break;
  case MATCHING_BRACKETS_ANGLE:
    if (record->event.pressed) {
      SEND_STRING(SS_LSFT(SS_TAP(X_COMMA)) SS_LSFT(SS_TAP(X_DOT))
                      SS_TAP(X_LEFT));
    }
    break;

  case RGB_SLD:
    if (rawhid_state.rgb_control) {
      return false;
    }
    if (record->event.pressed) {
      rgblight_mode(1);
    }
    return false;
  }
  return true;
}

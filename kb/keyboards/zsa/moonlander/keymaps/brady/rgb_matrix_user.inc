RGB_MATRIX_EFFECT(dracula_static)
RGB_MATRIX_EFFECT(dracula_gradient)

// RM THIS
// #define RGB_MATRIX_CUSTOM_EFFECT_IMPLS

#ifdef RGB_MATRIX_CUSTOM_EFFECT_IMPLS

// https://en.wikipedia.org/wiki/Dracula_(color_scheme)
const rgb_t drac_cyn = {.r = 0x8b, .g = 0xe9, .b = 0xfd};
const rgb_t drac_grn = {.r = 0x50, .g = 0xfa, .b = 0x7b};
const rgb_t drac_org = {.r = 0xff, .g = 0xb8, .b = 0x6c};
const rgb_t drac_pnk = {.r = 0xff, .g = 0x79, .b = 0xc6};
const rgb_t drac_prp = {.r = 0xbd, .g = 0x93, .b = 0xf9};
const rgb_t drac_red = {.r = 0xff, .g = 0x55, .b = 0x55};
const rgb_t drac_ylw = {.r = 0xf1, .g = 0xfa, .b = 0x8c};

const rgb_t drac_rgb_8[] = {drac_cyn, drac_grn, drac_org, drac_pnk,
                            drac_prp, drac_ylw, drac_cyn, drac_grn};

static bool dracula_static(effect_params_t *params) {
  RGB_MATRIX_USE_LIMITS(led_min, led_max);
  for (uint8_t i = led_min; i < led_max; i++) {
    RGB_MATRIX_TEST_LED_FLAGS();
    rgb_t rgb = drac_rgb_8[g_led_config.point[i].x >> 5];
    rgb_matrix_set_color(i, rgb.r, rgb.g, rgb.b);
  }
  return rgb_matrix_check_finished_leds(led_max);
}

static bool dracula_gradient(effect_params_t *params) {
  RGB_MATRIX_USE_LIMITS(led_min, led_max);

  return rgb_matrix_check_finished_leds(led_max);
}

#endif // RGB_MATRIX_CUSTOM_EFFECT_IMPLS

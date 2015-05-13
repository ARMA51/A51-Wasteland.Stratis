#define SOUND(name,path) \
  class name { \
    name = #name; \
    sound[] = {#path, 1, 1}; \
    titles[] = {}; \
  }

#define PATH(name) addons\boomerang\sounds\##name##

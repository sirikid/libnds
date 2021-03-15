
//{{BLOCK(keyboardGfx)

//======================================================================
//
//	keyboardGfx, 256x320@4, 
//	+ palette 16 entries, not compressed
//	+ 857 tiles (t|f reduced) lz77 compressed
//	+ regular map (flat), not compressed, 32x40 
//	Total size: 32 + 8940 + 2560 = 11532
//
//	Time-stamp: 2021-03-15, 11:43:44
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.16
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_KEYBOARDGFX_H
#define GRIT_KEYBOARDGFX_H

#define keyboardGfxTilesLen 8940
extern const unsigned int keyboardGfxTiles[2235];

#define keyboardGfxMapLen 2560
extern const unsigned short keyboardGfxMap[1280];

#define keyboardGfxPalLen 32
extern const unsigned short keyboardGfxPal[16];

#endif // GRIT_KEYBOARDGFX_H

//}}BLOCK(keyboardGfx)

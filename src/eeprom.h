#ifndef _EEPROM_H
#define _EEPROM_H

#include <ultra64.h>

extern s32 IsBoardFeatureFlagSet(s32 feature);
extern void SetBoardFeatureFlag(s32 feature);
extern void ClearBoardFeatureFlag(s32 feature);

#endif /* _EEPROM_H */
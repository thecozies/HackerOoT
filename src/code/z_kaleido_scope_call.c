#include "global.h"
#include "terminal.h"

void (*sKaleidoScopeUpdateFunc)(PlayState* play);
void (*sKaleidoScopeDrawFunc)(PlayState* play);
f32 gBossMarkScale;
u32 D_8016139C;
PauseMapMarksData* gLoadedPauseMarkDataTable;

extern void KaleidoScope_Update(PlayState* play);
extern void KaleidoScope_Draw(PlayState* play);

void KaleidoScopeCall_LoadPlayer(void) {
    KaleidoMgrOverlay* playerActorOvl = &gKaleidoMgrOverlayTable[KALEIDO_OVL_PLAYER_ACTOR];

    if (gKaleidoMgrCurOvl != playerActorOvl) {
        if (gKaleidoMgrCurOvl != NULL) {
            osSyncPrintf(VT_FGCOL(GREEN));
            osSyncPrintf("カレイド領域 強制排除\n"); // "Kaleido area forced exclusion"
            osSyncPrintf(VT_RST);

            KaleidoManager_ClearOvl(gKaleidoMgrCurOvl);
        }

        osSyncPrintf(VT_FGCOL(GREEN));
        osSyncPrintf("プレイヤーアクター搬入\n"); // "Player actor import"
        osSyncPrintf(VT_RST);

        KaleidoManager_LoadOvl(playerActorOvl);
    }
}

void KaleidoScopeCall_Init(PlayState* play) {
    // "Kaleidoscope replacement construction"
    osSyncPrintf("カレイド・スコープ入れ替え コンストラクト \n");

    sKaleidoScopeUpdateFunc = KaleidoManager_GetRamAddr(KaleidoScope_Update);
    sKaleidoScopeDrawFunc = KaleidoManager_GetRamAddr(KaleidoScope_Draw);

    LOG_ADDRESS("kaleido_scope_move", KaleidoScope_Update, "../z_kaleido_scope_call.c", 98);
    LOG_ADDRESS("kaleido_scope_move_func", sKaleidoScopeUpdateFunc, "../z_kaleido_scope_call.c", 99);
    LOG_ADDRESS("kaleido_scope_draw", KaleidoScope_Draw, "../z_kaleido_scope_call.c", 100);
    LOG_ADDRESS("kaleido_scope_draw_func", sKaleidoScopeDrawFunc, "../z_kaleido_scope_call.c", 101);

    KaleidoSetup_Init(play);
}

void KaleidoScopeCall_Destroy(PlayState* play) {
    // "Kaleidoscope replacement destruction"
    osSyncPrintf("カレイド・スコープ入れ替え デストラクト \n");

    KaleidoSetup_Destroy(play);
}

void KaleidoScopeCall_Update(PlayState* play) {
    KaleidoMgrOverlay* kaleidoScopeOvl = &gKaleidoMgrOverlayTable[KALEIDO_OVL_KALEIDO_SCOPE];
    PauseContext* pauseCtx = &play->pauseCtx;

#if (defined ENABLE_INV_EDITOR && defined ENABLE_EVENT_EDITOR)
    if ((pauseCtx->state != 0) || (pauseCtx->debugState != 0)) {
#else
    if (pauseCtx->state != 0) {
#endif
        if (pauseCtx->state == 1) {
            if (Letterbox_GetSize() == 0) {
                R_HREG_MODE = HREG_MODE_UCODE_DISAS;
                R_UCODE_DISAS_LOG_MODE = 3;
                R_PAUSE_MENU_MODE = 1;
                pauseCtx->unk_1E4 = 0;
                pauseCtx->unk_1EC = 0;
                pauseCtx->state = (pauseCtx->state & 0xFFFF) + 1;
            }
        } else if (pauseCtx->state == 8) {
            R_HREG_MODE = HREG_MODE_UCODE_DISAS;
            R_UCODE_DISAS_LOG_MODE = 3;
            R_PAUSE_MENU_MODE = 1;
            pauseCtx->unk_1E4 = 0;
            pauseCtx->unk_1EC = 0;
            pauseCtx->state = (pauseCtx->state & 0xFFFF) + 1;
        } else if ((pauseCtx->state == 2) || (pauseCtx->state == 9)) {
            osSyncPrintf("PR_KAREIDOSCOPE_MODE=%d\n", R_PAUSE_MENU_MODE);

            if (R_PAUSE_MENU_MODE >= 3) {
                pauseCtx->state++;
            }
        } else if (pauseCtx->state != 0) {
            if (gKaleidoMgrCurOvl != kaleidoScopeOvl) {
                if (gKaleidoMgrCurOvl != NULL) {
                    osSyncPrintf(VT_FGCOL(GREEN));
                    // "Kaleido area Player Forced Elimination"
                    osSyncPrintf("カレイド領域 プレイヤー 強制排除\n");
                    osSyncPrintf(VT_RST);

                    KaleidoManager_ClearOvl(gKaleidoMgrCurOvl);
                }

                osSyncPrintf(VT_FGCOL(GREEN));
                // "Kaleido area Kaleidoscope loading"
                osSyncPrintf("カレイド領域 カレイドスコープ搬入\n");
                osSyncPrintf(VT_RST);

                KaleidoManager_LoadOvl(kaleidoScopeOvl);
            }

            if (gKaleidoMgrCurOvl == kaleidoScopeOvl) {
                sKaleidoScopeUpdateFunc(play);

#if (defined ENABLE_INV_EDITOR && defined ENABLE_EVENT_EDITOR)
                if ((play->pauseCtx.state == 0) && (play->pauseCtx.debugState == 0)) {
#else
                if ((play->pauseCtx.state == 0)) {
#endif
                    osSyncPrintf(VT_FGCOL(GREEN));
                    // "Kaleido area Kaleidoscope Emission"
                    osSyncPrintf("カレイド領域 カレイドスコープ排出\n");
                    osSyncPrintf(VT_RST);

                    KaleidoManager_ClearOvl(kaleidoScopeOvl);
                    KaleidoScopeCall_LoadPlayer();
                }
            }
        }
    }
}

void KaleidoScopeCall_Draw(PlayState* play) {
    KaleidoMgrOverlay* kaleidoScopeOvl = &gKaleidoMgrOverlayTable[KALEIDO_OVL_KALEIDO_SCOPE];

    if (R_PAUSE_MENU_MODE >= 3) {
        if (((play->pauseCtx.state >= 4) && (play->pauseCtx.state <= 7)) ||
            ((play->pauseCtx.state >= 11) && (play->pauseCtx.state <= 18))) {
            if (gKaleidoMgrCurOvl == kaleidoScopeOvl) {
                sKaleidoScopeDrawFunc(play);
            }
        }
    }
}

class Lang {
    public static var ALL(default, null):haxe.ds.StringMap<String> = new haxe.ds.StringMap();
    public static var FALLBACK(default, null):haxe.ds.StringMap<String> = new haxe.ds.StringMap();
    
    public static function init(raw:String):Bool {
        ALL = parseXml(raw);
        return true;
    }
    public static function initFallback(raw:String):Bool {
        FALLBACK = parseXml(raw);
        return true;
    }
    public static function resolve(id:String):String {
        return ALL.exists(id) ? ALL.get(id) : (FALLBACK.exists(id) ? FALLBACK.get(id) : "#"+id+"#");
    }
    public static function format(id:String, args:Dynamic):String {
        var raw = resolve(id);
        for(v in Reflect.fields(args))
            raw = StringTools.replace(raw, "::"+v+"::", Reflect.field(args, v));
        return raw;
    }
    
    static function parseXml(raw:String):haxe.ds.StringMap<String> {
        var h = new haxe.ds.StringMap();
        var xml = Xml.parse(raw);
        for(e in xml.firstElement().elements()) {
            var id = e.get("id");
            var buf = new StringBuf();
            for(c in e) buf.add(c.toString());
            h.set(id, buf.toString());
        }
        return h;
    }
    
    // Generated string fields - will be populated at runtime
    public static function ScoreTarget(args:Dynamic):String return format("ScoreTarget", args);
    public static var LostBall(get, never):String; static function get_LostBall() return resolve("LostBall");
    public static var ScoreGoal(get, never):String; static function get_ScoreGoal() return resolve("ScoreGoal");
    public static var ConcedeGoal(get, never):String; static function get_ConcedeGoal() return resolve("ConcedeGoal");
    public static var ConcedeGoalYourself(get, never):String; static function get_ConcedeGoalYourself() return resolve("ConcedeGoalYourself");
    public static var TimeOut(get, never):String; static function get_TimeOut() return resolve("TimeOut");
    public static var TimeWarning60(get, never):String; static function get_TimeWarning60() return resolve("TimeWarning60");
    public static var TimeWarning30(get, never):String; static function get_TimeWarning30() return resolve("TimeWarning30");
    public static var TimeWarning10(get, never):String; static function get_TimeWarning10() return resolve("TimeWarning10");
    public static var ShootOut(get, never):String; static function get_ShootOut() return resolve("ShootOut");
    public static var ShootOutBlocked(get, never):String; static function get_ShootOutBlocked() return resolve("ShootOutBlocked");
    public static var Loading(get, never):String; static function get_Loading() return resolve("Loading");
    public static var Abandon(get, never):String; static function get_Abandon() return resolve("Abandon");
    public static var BuyButton(get, never):String; static function get_BuyButton() return resolve("BuyButton");
    public static var BuyPage(get, never):String; static function get_BuyPage() return resolve("BuyPage");
    public static var BuyScreenColors(get, never):String; static function get_BuyScreenColors() return resolve("BuyScreenColors");
    public static var BuyScreenDevs(get, never):String; static function get_BuyScreenDevs() return resolve("BuyScreenDevs");
    public static var BuyScreenMap(get, never):String; static function get_BuyScreenMap() return resolve("BuyScreenMap");
    public static var BuyScreenOriginal1(get, never):String; static function get_BuyScreenOriginal1() return resolve("BuyScreenOriginal1");
    public static var BuyScreenOriginal2(get, never):String; static function get_BuyScreenOriginal2() return resolve("BuyScreenOriginal2");
    public static var Cancel(get, never):String; static function get_Cancel() return resolve("Cancel");
    public static var ChooseHandMode(get, never):String; static function get_ChooseHandMode() return resolve("ChooseHandMode");
    public static var CodeExplanation(get, never):String; static function get_CodeExplanation() return resolve("CodeExplanation");
    public static var Code_PlayedGame(get, never):String; static function get_Code_PlayedGame() return resolve("Code_PlayedGame");
    public static var Code_UnlockedGame(get, never):String; static function get_Code_UnlockedGame() return resolve("Code_UnlockedGame");
    public static var Code_WinEpic(get, never):String; static function get_Code_WinEpic() return resolve("Code_WinEpic");
    public static var Code_WinHard(get, never):String; static function get_Code_WinHard() return resolve("Code_WinHard");
    public static var Code_WinNormal(get, never):String; static function get_Code_WinNormal() return resolve("Code_WinNormal");
    public static var CompleteHardModeFirst(get, never):String; static function get_CompleteHardModeFirst() return resolve("CompleteHardModeFirst");
    public static function CompleteLevelX(args:Dynamic):String return format("CompleteLevelX", args);
    public static function FinalObjective(args:Dynamic):String return format("FinalObjective", args);
    public static function ObjectiveN(args:Dynamic):String return format("ObjectiveN", args);
    public static var Options(get, never):String; static function get_Options() return resolve("Options");
    public static var OurGames(get, never):String; static function get_OurGames() return resolve("OurGames");
    public static var PAnvils(get, never):String; static function get_PAnvils() return resolve("PAnvils");
    public static var PAttackWall(get, never):String; static function get_PAttackWall() return resolve("PAttackWall");
    public static var PBadGoal(get, never):String; static function get_PBadGoal() return resolve("PBadGoal");
    public static var PBowling(get, never):String; static function get_PBowling() return resolve("PBowling");
    public static var PBumpers(get, never):String; static function get_PBumpers() return resolve("PBumpers");
    public static var PCornerTeleports(get, never):String; static function get_PCornerTeleports() return resolve("PCornerTeleports");
    public static var PDefenseWall(get, never):String; static function get_PDefenseWall() return resolve("PDefenseWall");
    public static var PElectric(get, never):String; static function get_PElectric() return resolve("PElectric");
    public static var PFast(get, never):String; static function get_PFast() return resolve("PFast");
    public static var PGlue(get, never):String; static function get_PGlue() return resolve("PGlue");
    public static var PGoalWall(get, never):String; static function get_PGoalWall() return resolve("PGoalWall");
    public static function PickTime(args:Dynamic):String return format("PickTime", args);
    public static var PKamikaze(get, never):String; static function get_PKamikaze() return resolve("PKamikaze");
    public static var PleaseRateUs(get, never):String; static function get_PleaseRateUs() return resolve("PleaseRateUs");
    public static var PLeather(get, never):String; static function get_PLeather() return resolve("PLeather");
    public static var PLifeBelt(get, never):String; static function get_PLifeBelt() return resolve("PLifeBelt");
    public static var PMiddleWall(get, never):String; static function get_PMiddleWall() return resolve("PMiddleWall");
    public static var PMines(get, never):String; static function get_PMines() return resolve("PMines");
    public static var PNoGoal(get, never):String; static function get_PNoGoal() return resolve("PNoGoal");
    public static var PPumpkins(get, never):String; static function get_PPumpkins() return resolve("PPumpkins");
    public static var PRocks(get, never):String; static function get_PRocks() return resolve("PRocks");
    public static var ProductNotAvailable(get, never):String; static function get_ProductNotAvailable() return resolve("ProductNotAvailable");
    public static var PRugby(get, never):String; static function get_PRugby() return resolve("PRugby");
    public static var PSideWarp(get, never):String; static function get_PSideWarp() return resolve("PSideWarp");
    public static var PSlow(get, never):String; static function get_PSlow() return resolve("PSlow");
    public static var PSnow(get, never):String; static function get_PSnow() return resolve("PSnow");
    public static var PSuperFast(get, never):String; static function get_PSuperFast() return resolve("PSuperFast");
    public static var PSuperStrong(get, never):String; static function get_PSuperStrong() return resolve("PSuperStrong");
    public static var PSuperWet(get, never):String; static function get_PSuperWet() return resolve("PSuperWet");
    public static var PTeleports(get, never):String; static function get_PTeleports() return resolve("PTeleports");
    public static var PWeak(get, never):String; static function get_PWeak() return resolve("PWeak");
    public static var PWet(get, never):String; static function get_PWet() return resolve("PWet");
    public static var PWindLight(get, never):String; static function get_PWindLight() return resolve("PWindLight");
    public static var PWindMedium(get, never):String; static function get_PWindMedium() return resolve("PWindMedium");
    public static var PWindStrong(get, never):String; static function get_PWindStrong() return resolve("PWindStrong");
    public static var Quality(get, never):String; static function get_Quality() return resolve("Quality");
    public static var QuickMatch(get, never):String; static function get_QuickMatch() return resolve("QuickMatch");
    public static var Rate(get, never):String; static function get_Rate() return resolve("Rate");
    public static var Restart(get, never):String; static function get_Restart() return resolve("Restart");
    public static var RestoreExplanation(get, never):String; static function get_RestoreExplanation() return resolve("RestoreExplanation");
    public static var RestoreFailed(get, never):String; static function get_RestoreFailed() return resolve("RestoreFailed");
    public static var RestorePurchase(get, never):String; static function get_RestorePurchase() return resolve("RestorePurchase");
    public static var RestoreShort(get, never):String; static function get_RestoreShort() return resolve("RestoreShort");
    public static var RetrieveBall(get, never):String; static function get_RetrieveBall() return resolve("RetrieveBall");
    public static var Right(get, never):String; static function get_Right() return resolve("Right");
    public static var RightHanded(get, never):String; static function get_RightHanded() return resolve("RightHanded");
    public static var Sale(get, never):String; static function get_Sale() return resolve("Sale");
    public static var Sfx(get, never):String; static function get_Sfx() return resolve("Sfx");
    public static function ShareCup(args:Dynamic):String return format("ShareCup", args);
    public static function ShareMatch(args:Dynamic):String return format("ShareMatch", args);
    public static function ShareMatchFacebook(args:Dynamic):String return format("ShareMatchFacebook", args);
    public static var ShareTwitter(get, never):String; static function get_ShareTwitter() return resolve("ShareTwitter");
    public static var SkipRating(get, never):String; static function get_SkipRating() return resolve("SkipRating");
    public static var Start(get, never):String; static function get_Start() return resolve("Start");
    public static var ThankYou(get, never):String; static function get_ThankYou() return resolve("ThankYou");
    public static var Tuto1_0(get, never):String; static function get_Tuto1_0() return resolve("Tuto1_0");
    public static var Tuto1_1(get, never):String; static function get_Tuto1_1() return resolve("Tuto1_1");
    public static var Tuto1_2(get, never):String; static function get_Tuto1_2() return resolve("Tuto1_2");
    public static var Tuto2_0(get, never):String; static function get_Tuto2_0() return resolve("Tuto2_0");
    public static var Tuto2_1(get, never):String; static function get_Tuto2_1() return resolve("Tuto2_1");
    public static var Tuto2_2(get, never):String; static function get_Tuto2_2() return resolve("Tuto2_2");
    public static var Tuto3_0(get, never):String; static function get_Tuto3_0() return resolve("Tuto3_0");
    public static var Tuto3_1(get, never):String; static function get_Tuto3_1() return resolve("Tuto3_1");
    public static var Tuto3_2(get, never):String; static function get_Tuto3_2() return resolve("Tuto3_2");
    public static var Tuto3_3(get, never):String; static function get_Tuto3_3() return resolve("Tuto3_3");
    public static var Tuto3_4(get, never):String; static function get_Tuto3_4() return resolve("Tuto3_4");
    public static var TutoElec_0(get, never):String; static function get_TutoElec_0() return resolve("TutoElec_0");
    public static var TutoElec_1(get, never):String; static function get_TutoElec_1() return resolve("TutoElec_1");
    public static var TutoElec_2(get, never):String; static function get_TutoElec_2() return resolve("TutoElec_2");
    public static var TutoFaultRed_0(get, never):String; static function get_TutoFaultRed_0() return resolve("TutoFaultRed_0");
    public static var TutoFaultStarPlayer_0(get, never):String; static function get_TutoFaultStarPlayer_0() return resolve("TutoFaultStarPlayer_0");
    public static var TutoFaultYellow_0(get, never):String; static function get_TutoFaultYellow_0() return resolve("TutoFaultYellow_0");
    public static var TutoFaultYellow_1(get, never):String; static function get_TutoFaultYellow_1() return resolve("TutoFaultYellow_1");
    public static var TutoMatch_0(get, never):String; static function get_TutoMatch_0() return resolve("TutoMatch_0");
    public static var TutoMatch_1(get, never):String; static function get_TutoMatch_1() return resolve("TutoMatch_1");
    public static var TutoMatch_2(get, never):String; static function get_TutoMatch_2() return resolve("TutoMatch_2");
    public static var TutoWellDone(get, never):String; static function get_TutoWellDone() return resolve("TutoWellDone");
    public static var UnlockedEpic(get, never):String; static function get_UnlockedEpic() return resolve("UnlockedEpic");
    public static var UnlockedHard(get, never):String; static function get_UnlockedHard() return resolve("UnlockedHard");
    public static var Version(get, never):String; static function get_Version() return resolve("Version");
    public static var YouLose(get, never):String; static function get_YouLose() return resolve("YouLose");
    public static var YouWin(get, never):String; static function get_YouWin() return resolve("YouWin");
    public static var YouWinFinal(get, never):String; static function get_YouWinFinal() return resolve("YouWinFinal");
    public static var Confirm(get, never):String; static function get_Confirm() return resolve("Confirm");
    public static var Continue(get, never):String; static function get_Continue() return resolve("Continue");
    public static var Controls(get, never):String; static function get_Controls() return resolve("Controls");
    public static var CreditDev(get, never):String; static function get_CreditDev() return resolve("CreditDev");
    public static var CreditMusic(get, never):String; static function get_CreditMusic() return resolve("CreditMusic");
    public static var Credits(get, never):String; static function get_Credits() return resolve("Credits");
    public static var Credits1(get, never):String; static function get_Credits1() return resolve("Credits1");
    public static var Credits2(get, never):String; static function get_Credits2() return resolve("Credits2");
    public static var Credits3(get, never):String; static function get_Credits3() return resolve("Credits3");
    public static var Credits4(get, never):String; static function get_Credits4() return resolve("Credits4");
    public static var CrowdSfx(get, never):String; static function get_CrowdSfx() return resolve("CrowdSfx");
    public static var CustomizeYourColors(get, never):String; static function get_CustomizeYourColors() return resolve("CustomizeYourColors");
    public static var Easy(get, never):String; static function get_Easy() return resolve("Easy");
    public static var Epic(get, never):String; static function get_Epic() return resolve("Epic");
    public static var Exclusion(get, never):String; static function get_Exclusion() return resolve("Exclusion");
    public static var Fault(get, never):String; static function get_Fault() return resolve("Fault");
    public static var Hard(get, never):String; static function get_Hard() return resolve("Hard");
    public static var High(get, never):String; static function get_High() return resolve("High");
    public static var Install(get, never):String; static function get_Install() return resolve("Install");
    public static var Language(get, never):String; static function get_Language() return resolve("Language");
    public static var Left(get, never):String; static function get_Left() return resolve("Left");
    public static var LeftHanded(get, never):String; static function get_LeftHanded() return resolve("LeftHanded");
    public static var LoadingPrice(get, never):String; static function get_LoadingPrice() return resolve("LoadingPrice");
    public static var Low(get, never):String; static function get_Low() return resolve("Low");
    public static var Music(get, never):String; static function get_Music() return resolve("Music");
    public static var NetworkError(get, never):String; static function get_NetworkError() return resolve("NetworkError");
    public static var Normal(get, never):String; static function get_Normal() return resolve("Normal");
    public static var Objective1(get, never):String; static function get_Objective1() return resolve("Objective1");
    public static var OurWebGames(get, never):String; static function get_OurWebGames() return resolve("OurWebGames");
}

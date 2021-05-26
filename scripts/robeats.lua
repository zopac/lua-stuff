--[[
    RoBeats CS Auto Player
    By Spencer#0003

    I actually documentated this script :flushed:
    24/05/21: Unpatched
]]

-- ScriptWare support

local getupvalue = (getupvalue or debug.getupvalue);

-- Init

local replicatedStorage = game:GetService("ReplicatedStorage");
local runService = game:GetService("RunService");

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LegoHacks/Utilities/main/UI.lua"))();

-- Main

local getNoteType;
local trackSystem, gameJoin;

do --> Do blocks are sexy.
    local trackSystemModule = require(replicatedStorage.RobeatsGameCore.NoteTrack.NoteTrackSystem);
    local gameJoinModule = require(replicatedStorage.RobeatsGameCore.RobeatsGame);
    local curveUtil = require(replicatedStorage.Shared.CurveUtil);

    local trackSystemNew = trackSystemModule.new;
    local gameJoinNew = gameJoinModule.new;
    local timescaleToDeltaTime = curveUtil.TimescaleToDeltaTime;

    function trackSystemModule.new(...)
        trackSystem = trackSystemNew(...); --> Grab the tracksystem.
        return trackSystem;
    end;

    function gameJoinModule.new(...)
        gameJoin = gameJoinNew(...); --> Grab gameJoin
        return gameJoin;
    end;

    function curveUtil.TimescaleToDeltaTime(self, ...)
        return (library.flags.song_speed and library.flags.chosen_speed / 30 or timescaleToDeltaTime(self, ...));
    end;

    -- Thanks Cyclops

    local noteResults = require(replicatedStorage.RobeatsGameCore.Enums.NoteResult); -- Auto update enums.

    local enum_res = {
        missResult = noteResults.Miss;
        okayResult = noteResults.Okay;
        goodResult = noteResults.Good;
        greatResult = noteResults.Great;
        perfectResult = noteResults.Perfect;
        marvelousResult = noteResults.Marvelous;
    };

    local mapped_e = {
        enum_res.marvelousResult;
        enum_res.perfectResult;
        enum_res.greatResult;
        enum_res.goodPercentage;
        enum_res.okayResult;
        enum_res.missPercentage;
    };

    function getNoteType()
        local r = Random.new();
        for i, v in ipairs{library.flags.marvelousPercentage, library.flags.perfectPercentage, library.flags.greatPercentage, library.flags.goodPercentage, library.flags.okayResult} do
            if (r:NextNumber(0, 100) <= v) then
                return mapped_e[i];
            end;
        end;

        return enum_res.missPercentage;
    end;
end;

local robeatsCS = library:CreateWindow("RoBeats CS");

robeatsCS:AddSlider({
    text = "Marvelous";
    flag = "marvelousPercentage";
    min = 0;
    max = 100;
    default = 100;
});

robeatsCS:AddSlider({
    text = "Perfect";
    flag = "perfectPercentage";
    min = 0;
    max = 100;
    default = 0;
});

robeatsCS:AddSlider({
    text = "Great";
    flag = "greatPercentage";
    min = 0;
    max = 100;
    default = 0;
});

robeatsCS:AddSlider({
    text = "Good";
    flag = "goodPercentage";
    min = 0;
    max = 100;
    default = 0;
});

robeatsCS:AddSlider({
    text = "Okay";
    flag = "okayResult";
    min = 0;
    max = 100;
    default = 0;
});

robeatsCS:AddSlider({
    text = "Miss";
    flag = "missPercentage";
    min = 0;
    max = 100;
    default = 0;
});

robeatsCS:AddToggle({
    text = "Enabled";
    flag = "enabled";
});

local misc = library:CreateWindow("Misc");

misc:AddToggle({
    text = "Song Speed";
    flag = "song_speed";
});

misc:AddSlider({
    text = "Speed";
    flag = "chosen_speed";
    min = 1;
    max = 5;
    default = 1;
});

runService:BindToRenderStep("RoBeat CS Hackles", 5, function()
    if (library.flags.enabled and gameJoin and trackSystem) then
        local notes = trackSystem.get_notes(); --> Get all notes
        for i = 1, notes:count() do --> Loop through each note
            local noteType = getNoteType();
            local note = notes:get(i); --> Get the note.
            local noteTrack = note:get_track_index(); --> Get the track index.
            local testResult, testScoreResult, renderableHit = note:test_hit(); --> Test note hit result e.g. Marvelous, perfect etc.
            local testRelease, releaseScoreResult, renderableRelease = note:test_release(); --> Test note hit result e.g. Marvelous, perfect etc.
            local track = trackSystem:get_track(noteTrack); --> Get track.

            if (testResult and testScoreResult == noteType) then
                track:press(); --> Press track (doesn't actually hit note).
                note:on_hit(noteType, i, renderableHit); --> Fire on hit event for current note with chosen result e.g. Marvelous.
                delay(math.random(0.01, 0.5), function()
                    if (note.Type ~= "HeldNote") then
                        track:release(); --> Release the track.
                    end;
                end);
            elseif (testRelease and releaseScoreResult == noteType) then
                if (note.Type == "HeldNote") then
                    note:on_release(noteType, i, renderableRelease); --> If note is held, release it.
                    track:release(); --> Release the track.
                end;
            end;
        end;
    end;
end);

library:Init();

function main()
    local numTestCases = tonumber(io.read())

    for i = 1, numTestCases do
        local inputNotes = io.read()
        local notes = {}
        for note in inputNotes:gmatch("%S+") do
            table.insert(notes, tonumber(note))
        end

        local chordName = determineChordName(notes)
        io.write(chordName, " ")
    end
end

function determineChordName(notes)
    local steps = {}
    for i = 2, #notes do
        local diff = (notes[i] - notes[i - 1] + 12) % 12
        table.insert(steps, diff)
    end

    if contains(steps, 3) and contains(steps, 4) then
        return "other"
    elseif contains(steps, 4) then
        return getChordName(notes[1], true)
    elseif contains(steps, 3) then
        return getChordName(notes[1], false)
    else
        return "other"
    end
end

function getChordName(rootNote, isMajor)
    local noteNames = {
        "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"
    }
    local rootNoteName = noteNames[rootNote % 12 + 1]
    if isMajor then
        return rootNoteName .. "-major"
    end
    return rootNoteName .. "-minor"
end

function contains(arr, target)
    for _, num in ipairs(arr) do
        if num == target then
            return true
        end
    end
    return false
end

main()

#!/bin/bash

# Transcribe mp4 video or audio file using OpenAI Whisper
# https://github.com/openai/whisper/blob/main/README.md
# Usage example: language=Danish model=base model=base ttml=yes task=translate whisper.sh mymovie.mp4

# Valid languages:
#
#af,am,ar,as,az,ba,be,bg,bn,bo,br,bs,ca,cs,cy,da,de,el,en,es,et,eu,fa,fi,fo,fr,gl,gu,ha,haw,he,hi,hr,ht,hu,hy,id,is,it,ja,jw,ka,kk,km,kn,ko,la,lb,ln,lo,lt,lv,mg,mi,mk,ml,mn,mr,ms,mt,my,ne,nl,nn,no,oc,pa,pl,ps,pt,ro,ru,sa,sd,si,sk,sl,sn,so,sq,sr,su,sv,sw,ta,te,tg,th,tk,tl,tr,tt,uk,ur,uz,vi,yi,yo,yue,zh,Afrikaans,Albanian,Amharic,Arabic,Armenian,Assamese,Azerbaijani,Bashkir,Basque,Belarusian,Bengali,Bosnian,Breton,Bulgarian,Burmese,Cantonese,Castilian,Catalan,Chinese,Croatian,Czech,Danish,Dutch,English,Estonian,Faroese,Finnish,Flemish,French,Galician,Georgian,German,Greek,Gujarati,Haitian,Haitian Creole,Hausa,Hawaiian,Hebrew,Hindi,Hungarian,Icelandic,Indonesian,Italian,Japanese,Javanese,Kannada,Kazakh,Khmer,Korean,Lao,Latin,Latvian,Letzeburgesch,Lingala,Lithuanian,Luxembourgish,Macedonian,Malagasy,Malay,Malayalam,Maltese,Mandarin,Maori,Marathi,Moldavian,Moldovan,Mongolian,Myanmar,Nepali,Norwegian,Nynorsk,Occitan,Panjabi,Pashto,Persian,Polish,Portuguese,Punjabi,Pushto,Romanian,Russian,Sanskrit,Serbian,Shona,Sindhi,Sinhala,Sinhalese,Slovak,Slovenian,Somali,Spanish,Sundanese,Swahili,Swedish,Tagalog,Tajik,Tamil,Tatar,Telugu,Thai,Tibetan,Turkish,Turkmen,Ukrainian,Urdu,Uzbek,Valencian,Vietnamese,Welsh,Yiddish,Yoruba

# Valid models: base, turbo, ...

filename="$1"

language="${language:-English}"
model="${model:-turbo}"
ttml="${ttml:-}"
task="${task:-transcribe}"

# whisper names its output after the input file minus the extension
bname="${filename%.*}"
extension="${filename##*.}"

if [[ "${extension,,}" == "mp4" ]]; then
	# Extract the audio from the video file first
	ffmpeg -nostdin -y -i "$filename" -vn "$bname.m4a"
	input="$bname.m4a"
else
	input="$filename"
fi
# Generate the .srt file
whisper "$input" --task $task --model $model --language $language --output_format srt --verbose False

# Convert the .srt file to .ttml
if [ -n "$ttml" ]; then
	tt convert -i "$bname.srt" -o "$bname.ttml"
fi

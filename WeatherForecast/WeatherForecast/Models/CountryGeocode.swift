/*
 Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar
 */




import Foundation

struct CountryGeocodeModel: Codable {
    
    var name       : String?     = nil
    var localNames : LocalNames? = LocalNames()
    var lat        : Double?     = nil
    var lon        : Double?     = nil
    var country    : String?     = nil
    var state      : String?     = nil
    
    enum CodingKeys: String, CodingKey {
        
        case name       = "name"
        case localNames = "local_names"
        case lat        = "lat"
        case lon        = "lon"
        case country    = "country"
        case state      = "state"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name       = try values.decodeIfPresent(String.self     , forKey: .name       )
        localNames = try values.decodeIfPresent(LocalNames.self , forKey: .localNames )
        lat        = try values.decodeIfPresent(Double.self     , forKey: .lat        )
        lon        = try values.decodeIfPresent(Double.self     , forKey: .lon        )
        country    = try values.decodeIfPresent(String.self     , forKey: .country    )
        state      = try values.decodeIfPresent(String.self     , forKey: .state      )
        
    }
    
    init() {
        
    }
    
}



import Foundation

struct LocalNames: Codable {
    
    var ms : String? = nil
    var gd : String? = nil
    var cs : String? = nil
    var eu : String? = nil
    var my : String? = nil
    var `as` : String? = nil
    var os : String? = nil
    var bg : String? = nil
    var lb : String? = nil
    var cy : String? = nil
    var jv : String? = nil
    var yi : String? = nil
    var ku : String? = nil
    var yo : String? = nil
    var sv : String? = nil
    var sd : String? = nil
    var ne : String? = nil
    var kn : String? = nil
    var be : String? = nil
    var ru : String? = nil
    var th : String? = nil
    var ug : String? = nil
    var es : String? = nil
    var br : String? = nil
    var ha : String? = nil
    var hy : String? = nil
    var pt : String? = nil
    var si : String? = nil
    var gu : String? = nil
    var fr : String? = nil
    var zh : String? = nil
    var tl : String? = nil
    var sl : String? = nil
    var lv : String? = nil
    var tr : String? = nil
    var tt : String? = nil
    var da : String? = nil
    var mn : String? = nil
    var ie : String? = nil
    var ja : String? = nil
    var fi : String? = nil
    var te : String? = nil
    var gl : String? = nil
    var bs : String? = nil
    var ta : String? = nil
    var hi : String? = nil
    var ny : String? = nil
    var it : String? = nil
    var ar : String? = nil
    var ba : String? = nil
    var hr : String? = nil
    var vo : String? = nil
    var an : String? = nil
    var gn : String? = nil
    var li : String? = nil
    var hu : String? = nil
    var `is` : String? = nil
    var bh : String? = nil
    var io : String? = nil
    var ky : String? = nil
    var sq : String? = nil
    var kw : String? = nil
    var so : String? = nil
    var uz : String? = nil
    var eo : String? = nil
    var sr : String? = nil
    var cv : String? = nil
    var ki : String? = nil
    var oc : String? = nil
    var af : String? = nil
    var ga : String? = nil
    var pl : String? = nil
    var ur : String? = nil
    var sw : String? = nil
    var tg : String? = nil
    var fa : String? = nil
    var id : String? = nil
    var en : String? = nil
    var mk : String? = nil
    var tk : String? = nil
    var no : String? = nil
    var uk : String? = nil
    var vi : String? = nil
    var mr : String? = nil
    var el : String? = nil
    var he : String? = nil
    var ml : String? = nil
    var nl : String? = nil
    var ro : String? = nil
    var ko : String? = nil
    var se : String? = nil
    var kk : String? = nil
    var de : String? = nil
    var ps : String? = nil
    var fy : String? = nil
    var ka : String? = nil
    var sk : String? = nil
    var et : String? = nil
    var am : String? = nil
    var ks : String? = nil
    var pa : String? = nil
    var fo : String? = nil
    var lt : String? = nil
    
    enum CodingKeys: String, CodingKey {
        
        case ms = "ms"
        case gd = "gd"
        case cs = "cs"
        case eu = "eu"
        case my = "my"
        case `as` = "as"
        case os = "os"
        case bg = "bg"
        case lb = "lb"
        case cy = "cy"
        case jv = "jv"
        case yi = "yi"
        case ku = "ku"
        case yo = "yo"
        case sv = "sv"
        case sd = "sd"
        case ne = "ne"
        case kn = "kn"
        case be = "be"
        case ru = "ru"
        case th = "th"
        case ug = "ug"
        case es = "es"
        case br = "br"
        case ha = "ha"
        case hy = "hy"
        case pt = "pt"
        case si = "si"
        case gu = "gu"
        case fr = "fr"
        case zh = "zh"
        case tl = "tl"
        case sl = "sl"
        case lv = "lv"
        case tr = "tr"
        case tt = "tt"
        case da = "da"
        case mn = "mn"
        case ie = "ie"
        case ja = "ja"
        case fi = "fi"
        case te = "te"
        case gl = "gl"
        case bs = "bs"
        case ta = "ta"
        case hi = "hi"
        case ny = "ny"
        case it = "it"
        case ar = "ar"
        case ba = "ba"
        case hr = "hr"
        case vo = "vo"
        case an = "an"
        case gn = "gn"
        case li = "li"
        case hu = "hu"
        case `is` = "is"
        case bh = "bh"
        case io = "io"
        case ky = "ky"
        case sq = "sq"
        case kw = "kw"
        case so = "so"
        case uz = "uz"
        case eo = "eo"
        case sr = "sr"
        case cv = "cv"
        case ki = "ki"
        case oc = "oc"
        case af = "af"
        case ga = "ga"
        case pl = "pl"
        case ur = "ur"
        case sw = "sw"
        case tg = "tg"
        case fa = "fa"
        case id = "id"
        case en = "en"
        case mk = "mk"
        case tk = "tk"
        case no = "no"
        case uk = "uk"
        case vi = "vi"
        case mr = "mr"
        case el = "el"
        case he = "he"
        case ml = "ml"
        case nl = "nl"
        case ro = "ro"
        case ko = "ko"
        case se = "se"
        case kk = "kk"
        case de = "de"
        case ps = "ps"
        case fy = "fy"
        case ka = "ka"
        case sk = "sk"
        case et = "et"
        case am = "am"
        case ks = "ks"
        case pa = "pa"
        case fo = "fo"
        case lt = "lt"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        ms = try values.decodeIfPresent(String.self , forKey: .ms )
        gd = try values.decodeIfPresent(String.self , forKey: .gd )
        cs = try values.decodeIfPresent(String.self , forKey: .cs )
        eu = try values.decodeIfPresent(String.self , forKey: .eu )
        my = try values.decodeIfPresent(String.self , forKey: .my )
        `as` = try values.decodeIfPresent(String.self , forKey: .as )
        os = try values.decodeIfPresent(String.self , forKey: .os )
        bg = try values.decodeIfPresent(String.self , forKey: .bg )
        lb = try values.decodeIfPresent(String.self , forKey: .lb )
        cy = try values.decodeIfPresent(String.self , forKey: .cy )
        jv = try values.decodeIfPresent(String.self , forKey: .jv )
        yi = try values.decodeIfPresent(String.self , forKey: .yi )
        ku = try values.decodeIfPresent(String.self , forKey: .ku )
        yo = try values.decodeIfPresent(String.self , forKey: .yo )
        sv = try values.decodeIfPresent(String.self , forKey: .sv )
        sd = try values.decodeIfPresent(String.self , forKey: .sd )
        ne = try values.decodeIfPresent(String.self , forKey: .ne )
        kn = try values.decodeIfPresent(String.self , forKey: .kn )
        be = try values.decodeIfPresent(String.self , forKey: .be )
        ru = try values.decodeIfPresent(String.self , forKey: .ru )
        th = try values.decodeIfPresent(String.self , forKey: .th )
        ug = try values.decodeIfPresent(String.self , forKey: .ug )
        es = try values.decodeIfPresent(String.self , forKey: .es )
        br = try values.decodeIfPresent(String.self , forKey: .br )
        ha = try values.decodeIfPresent(String.self , forKey: .ha )
        hy = try values.decodeIfPresent(String.self , forKey: .hy )
        pt = try values.decodeIfPresent(String.self , forKey: .pt )
        si = try values.decodeIfPresent(String.self , forKey: .si )
        gu = try values.decodeIfPresent(String.self , forKey: .gu )
        fr = try values.decodeIfPresent(String.self , forKey: .fr )
        zh = try values.decodeIfPresent(String.self , forKey: .zh )
        tl = try values.decodeIfPresent(String.self , forKey: .tl )
        sl = try values.decodeIfPresent(String.self , forKey: .sl )
        lv = try values.decodeIfPresent(String.self , forKey: .lv )
        tr = try values.decodeIfPresent(String.self , forKey: .tr )
        tt = try values.decodeIfPresent(String.self , forKey: .tt )
        da = try values.decodeIfPresent(String.self , forKey: .da )
        mn = try values.decodeIfPresent(String.self , forKey: .mn )
        ie = try values.decodeIfPresent(String.self , forKey: .ie )
        ja = try values.decodeIfPresent(String.self , forKey: .ja )
        fi = try values.decodeIfPresent(String.self , forKey: .fi )
        te = try values.decodeIfPresent(String.self , forKey: .te )
        gl = try values.decodeIfPresent(String.self , forKey: .gl )
        bs = try values.decodeIfPresent(String.self , forKey: .bs )
        ta = try values.decodeIfPresent(String.self , forKey: .ta )
        hi = try values.decodeIfPresent(String.self , forKey: .hi )
        ny = try values.decodeIfPresent(String.self , forKey: .ny )
        it = try values.decodeIfPresent(String.self , forKey: .it )
        ar = try values.decodeIfPresent(String.self , forKey: .ar )
        ba = try values.decodeIfPresent(String.self , forKey: .ba )
        hr = try values.decodeIfPresent(String.self , forKey: .hr )
        vo = try values.decodeIfPresent(String.self , forKey: .vo )
        an = try values.decodeIfPresent(String.self , forKey: .an )
        gn = try values.decodeIfPresent(String.self , forKey: .gn )
        li = try values.decodeIfPresent(String.self , forKey: .li )
        hu = try values.decodeIfPresent(String.self , forKey: .hu )
        `is` = try values.decodeIfPresent(String.self , forKey: .is )
        bh = try values.decodeIfPresent(String.self , forKey: .bh )
        io = try values.decodeIfPresent(String.self , forKey: .io )
        ky = try values.decodeIfPresent(String.self , forKey: .ky )
        sq = try values.decodeIfPresent(String.self , forKey: .sq )
        kw = try values.decodeIfPresent(String.self , forKey: .kw )
        so = try values.decodeIfPresent(String.self , forKey: .so )
        uz = try values.decodeIfPresent(String.self , forKey: .uz )
        eo = try values.decodeIfPresent(String.self , forKey: .eo )
        sr = try values.decodeIfPresent(String.self , forKey: .sr )
        cv = try values.decodeIfPresent(String.self , forKey: .cv )
        ki = try values.decodeIfPresent(String.self , forKey: .ki )
        oc = try values.decodeIfPresent(String.self , forKey: .oc )
        af = try values.decodeIfPresent(String.self , forKey: .af )
        ga = try values.decodeIfPresent(String.self , forKey: .ga )
        pl = try values.decodeIfPresent(String.self , forKey: .pl )
        ur = try values.decodeIfPresent(String.self , forKey: .ur )
        sw = try values.decodeIfPresent(String.self , forKey: .sw )
        tg = try values.decodeIfPresent(String.self , forKey: .tg )
        fa = try values.decodeIfPresent(String.self , forKey: .fa )
        id = try values.decodeIfPresent(String.self , forKey: .id )
        en = try values.decodeIfPresent(String.self , forKey: .en )
        mk = try values.decodeIfPresent(String.self , forKey: .mk )
        tk = try values.decodeIfPresent(String.self , forKey: .tk )
        no = try values.decodeIfPresent(String.self , forKey: .no )
        uk = try values.decodeIfPresent(String.self , forKey: .uk )
        vi = try values.decodeIfPresent(String.self , forKey: .vi )
        mr = try values.decodeIfPresent(String.self , forKey: .mr )
        el = try values.decodeIfPresent(String.self , forKey: .el )
        he = try values.decodeIfPresent(String.self , forKey: .he )
        ml = try values.decodeIfPresent(String.self , forKey: .ml )
        nl = try values.decodeIfPresent(String.self , forKey: .nl )
        ro = try values.decodeIfPresent(String.self , forKey: .ro )
        ko = try values.decodeIfPresent(String.self , forKey: .ko )
        se = try values.decodeIfPresent(String.self , forKey: .se )
        kk = try values.decodeIfPresent(String.self , forKey: .kk )
        de = try values.decodeIfPresent(String.self , forKey: .de )
        ps = try values.decodeIfPresent(String.self , forKey: .ps )
        fy = try values.decodeIfPresent(String.self , forKey: .fy )
        ka = try values.decodeIfPresent(String.self , forKey: .ka )
        sk = try values.decodeIfPresent(String.self , forKey: .sk )
        et = try values.decodeIfPresent(String.self , forKey: .et )
        am = try values.decodeIfPresent(String.self , forKey: .am )
        ks = try values.decodeIfPresent(String.self , forKey: .ks )
        pa = try values.decodeIfPresent(String.self , forKey: .pa )
        fo = try values.decodeIfPresent(String.self , forKey: .fo )
        lt = try values.decodeIfPresent(String.self , forKey: .lt )
        
    }
    
    init() {
        
    }
    
}

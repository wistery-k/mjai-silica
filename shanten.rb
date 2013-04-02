module Shanten

  TBL = Array.new(1000000, 0)
  FIVE = [ 1, 5, 25, 125, 625, 3125, 15625, 78125, 390625, 1953125 ]

  module_function

  NORMAL = 1
  CHITOI = 2
  KOKUSI = 4

  NO_NORMAL = 6
  NO_CHITOI = 5
  NO_KOKUSI = 3
  ALL = 7

  def GET_TBL(key)
    buf = TBL[key >> 1] >> ((key & 1) << 4)
    [ buf & 0xF, (buf >> 4) & 0xF, (buf >> 8) & 0xF, (buf >> 12) & 0xF ]
  end

  def SET_TBL(key, val)
    TBL[key >> 1] |= val << ((key & 1) << 4)
    #TBL[key >> 1] |= (m0 | (t0 << 4) | (m1 << 8) | (t1 << 12)) << ((key & 1) << 4)
  end

  def init
    File.open(File.dirname(__FILE__) + "/shanten4_2.txt", "r") do |f|

      n = f.gets.to_i
      $stderr.puts n

      n.times do |i|
        key = f.gets(" ").to_i
        val = f.gets("\n").to_i
        SET_TBL(key, val)
      end
    end

  end

  def pick_menta(tehai, need_mentsu)
    m = Array.new(8, 0)
    t = Array.new(8, 0)

    mb = Array.new(2)
    tb = Array.new(2)

    3.times do |i|
      hash = 0
      9.times do |j|
        hash += tehai[i*9+j] * FIVE[j]
      end

      mb[0], tb[0], mb[1], tb[1] = GET_TBL(hash)

      8.times do |j|
        m[j] += mb[(j >> i) & 1]
        t[j] += tb[(j >> i) & 1]
      end
    end

    m_jihai = 0
    t_jihai = 0

    (27..33).each do |pai|
      case tehai[pai]
      when 2
        t_jihai += 1
      when 3, 4
        m_jihai += 1
      end
    end

    ans = 255
    
    8.times do |i|
      mm = m[i] + m_jihai
      tt = [t[i] + t_jihai, need_mentsu - mm].min
      ans = [ans, 8 - 2 * mm - tt].min
    end
    
    return ans
  end
  
  def normal(tehai, need_mentsu)
    
    ans = pick_menta(tehai, need_mentsu)

    (27..33).each do |pai|
      if tehai[pai] == 2
        tehai[pai] -= 2
        ans = [ans, pick_menta(tehai, need_mentsu) - 1].min
        tehai[pai] += 2
        return ans - (4 - need_mentsu) * 2
      end
    end
    
    (0..26).each do |pai|
      if tehai[pai] >= 2
        tehai[pai] -= 2
        ans = [ans, pick_menta(tehai, need_mentsu) - 1].min
        tehai[pai] += 2
      end
    end
    
    return ans - (4 - need_mentsu) * 2
  end

  YAOCHU = [ 0, 8, 9, 17, 18, 26, 27, 28, 29, 30, 31, 32, 33 ]

  def kokushi(tehai)
    kind = YAOCHU.count{|pai|tehai[pai]>=1}    
    if YAOCHU.any?{|pai|tehai[pai]>=2} then
      12 - kind
    else
      13 - kind
    end
  end

  def chitoi(tehai)
    toitsu = tehai.count{|x|x>=2}
    kind = tehai.count{|x|x>=1}
    6 - toitsu + [7 - kind, 0].max
  end

  def all(tehai, need_mentsu, mask)
    ans = 32
    ans = [ans, normal(tehai, need_mentsu)].max if mask & NORMAL != 0
    ans = [ans, chitoi(tehai)].max if mask & CHITOI != 0
    ans = [ans, kokushi(tehai)].max if mask & KOKUSI != 0
    return ans
  end

end

Shanten::init()


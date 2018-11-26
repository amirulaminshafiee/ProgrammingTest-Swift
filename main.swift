var player: [[Int]] = [[],[],[],[]]
var post:[Int] = []
var winner:[String] = ["A","B","C","D"]
var round = 1
for i in 0..<player.count
{
  for _ in 0..<6 
  {
    let randomInt = Int.random(in: 1...6)
    player[i].append(randomInt)
  }
}


while player.count == 4
{
  var playerCopy = player

  print("\n Round", round)
  print("After dice rolled:")
  for i in 0..<player.count
  {
    var str = ""
    player[i].forEach { str = str + String($0) + " "}
    print("Player",winner[i],": ",str)
  }


  for i in 0..<player.count
  {
    player[i] = player[i].filter { $0 != 6 }
    player[i] = player[i].filter { $0 != 1 }
  }

  for i in 0..<player.count
  {
    var no = 0
    if i == 0
    {
      no = playerCopy[3].filter { $0 == 1 }.count
    }
    else
    {
      no = playerCopy[i-1].filter { $0 == 1 }.count
    }
    
    for _ in 0..<no
    {
      player[i].append(1)
    }

  }

  print("\nAfter dice moved/removed:")
  for i in 0..<player.count
  {
    var str = ""
    player[i].forEach { str = str + String($0) + " "}
    print("Player",winner[i],": ",str)
  }

  for i in 0..<playerCopy.count
  {
    if player[i].isEmpty{
      player.remove(at: i)
      post.append(i)
      break
    }
  }
    
    for i in 0..<player.count
  {
    let length = player[i].count
    player[i].removeAll()
     
      for _ in 0..<length
    {
      let randomInt = Int.random(in: 1...6)
      player[i].append(randomInt)
    }
  }

  round = round + 1
}
 
print("\nWinner: ")
for i in 0..<post.count
{
  print(winner[post[i]])
}
#include <iostream>
#include <string>
#include <map>
#include <vector>
#include <typeinfo>
#include <algorithm>
using namespace std;

vector<string> fullDestinations;
vector<int> totalDistanceOfEachPath;

void findShortestPath(string str, int strBegin, int strEnd, string startingPoint)
{
    // je simule les distances entre les différents ports le temps de faire le C#
    map<string, int> distances;
    distances["DA"] = 5;
    distances["DB"] = 3;
    distances["DC"] = 4;
    distances["AB"] = 7;
    distances["AC"] = 8;
    distances["BA"] = 7;
    distances["BC"] = 12;
    distances["CB"] = 12;
    distances["CA"] = 8;
    distances["CD"] = 4;
    distances["BD"] = 3;
    distances["AD"] = 5;

    // map<string, int>::iterator it;

    if (strBegin == strEnd)
    {
        string mystr = startingPoint + str + startingPoint;
        int begin = 0;
        int end = begin + 1;
        string couple = "";
        int totalDistanceForcurrentCouple = 0;

        // cout << "\n";
        // cout << mystr << endl;

        for (int j = 0; j <= mystr.size(); j++)
        {
            couple = couple + mystr[begin] + mystr[end];
            begin++;
            end++;
            auto it = distances.find(couple);
            if (begin == mystr.size())
            {
                break;
            }
            // cout << couple << endl;
            couple = "";
            totalDistanceForcurrentCouple += it->second;
        }
        cout << totalDistanceForcurrentCouple << endl;
        totalDistanceOfEachPath.push_back(totalDistanceForcurrentCouple);
        fullDestinations.push_back(mystr);
    }
    else
    {

        for (int i = strBegin; i <= strEnd; i++)
        {

            swap(str[strBegin], str[i]);

            findShortestPath(str, strBegin + 1, strEnd, startingPoint);

            swap(str[strBegin], str[i]);
        }
    }
}

void getIndex(vector<int> v, int K)
{
    vector<int>::iterator it = find(v.begin(), v.end(), K);
    if (it != v.end())
    {

        int index = distance(v.begin(), it);
        cout << "Le chemin le plus court est " << fullDestinations[index] << endl;
    }
    else
    {
        cout << "Il est mauvais ton algo Jack! C'est la piquette Jack!" << endl;
    }
}

// pour l'exemple je suppose qu'on a des ports A,B,C,D et qu'il faut partir et revenir du port D en passant par A,B et C en trouvant le plus court chemin

int main()
{
    string necessaryPorts = "ABC";
    int length = necessaryPorts.size();
    findShortestPath(necessaryPorts, 0, length - 1, "D");

    for (auto path : fullDestinations)
    {
        cout << path << endl;
        cout << "\n";
    }

    int shortestDistance = 999;

    for (auto distance : totalDistanceOfEachPath)
    {
        if (distance < shortestDistance)
        {
            shortestDistance = distance;
        }
    }

    getIndex(totalDistanceOfEachPath, shortestDistance);

    return 0;
}
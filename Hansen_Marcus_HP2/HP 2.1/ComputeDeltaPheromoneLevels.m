function deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection)
  
 
  pheromoneLevels = zeros(size(pathCollection,2));
  

  for k = 1:size(pathCollection,1)
    antPath = pathCollection(k,:);
    pheromonesAnt = zeros(size(pathCollection,2)); 
    d_kCurrentAnt = pathLengthCollection(k,1);   
    for i = 1:size(antPath,2)
      start_node = antPath(i);
      endIndex = mod(i,length(pathLengthCollection))+1;
      end_node = antPath(endIndex);
      pheromonesAnt(start_node,end_node) = 1/d_kCurrentAnt;
    end
    pheromoneLevels = pheromoneLevels + pheromonesAnt;
  end
  
  deltaPheromoneLevel = pheromoneLevels;
end
package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.recipe.RecipeDTO;

public interface RecipeInter {

	String preread(int rno); //test
	
	Map imgRead(int rno);
	
	int create(RecipeDTO dto);

	RecipeDTO read(int rno);

	int update(RecipeDTO dto);

	int delete(int rno);

	List<RecipeDTO> list(Map map);

	int total(Map map);

	int upViewcnt(int rno);
	
	void recom(int rno);

	Map imgRead2(int rno);
}
public class recipeRandomizerExtension {
//	public Id recipeId { get; set; }
//    public Recipe__c currentRecipe { get; set; }
    
    public recipeRandomizerExtension(ApexPages.StandardController controller) {
//        currentRecipe =  (Recipe__c) controller.getRecord();
//     	recipeId = currentRecipe.Id;
     	getRandomRecipe();
       }

    public PageReference getRandomRecipe() {
        DateTime dateSeed = DateTime.Now();
        String dateSeedString = String.valueOfGmt(dateSeed);
        Integer lastNumber = Integer.valueOf(dateSeedString.right(1));
        List<Recipe__c> RecipeList = [SELECT Id FROM Recipe__c];
 		Integer randomizedIndex = Math.mod(lastNumber,RecipeList.size());
        
        PageReference pageRef = new PageReference('/'+RecipeList[randomizedIndex].Id);
        pageRef.setRedirect(true);
        return pageRef;
    }    
}